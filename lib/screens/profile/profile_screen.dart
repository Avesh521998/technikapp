import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/api/model/response/login_response_entity.dart';

import '../../api/model/response/logout_response_entity.dart';
import '../../common/constants.dart';
import '../../common/label_keys.dart';
import '../../common/local_colors.dart';
import '../../common/navigation_manager.dart';
import '../../common/shared_preference_helper.dart';
import '../../common/user_state_manager.dart';
import '../../custom/api_resource_widget.dart';
import '../../custom/button_common.dart';
import '../login/cubit/logout_cubit.dart';
import '../login/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LogoutCubit _logoutCubit = LogoutCubit();
  LoginResponseEntity? loginResponseEntity;
  @override
  void initState() {
    getUserDetail();
    super.initState();
  }

  void getUserDetail() async {
    loginResponseEntity = await getUserPreferenceData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _logoutCubit,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: const Text("My Account",style: TextStyle(
              color: LocalColors.PRIMARY_COLOR, fontSize: 24,fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 0,
              child: APIResourceWidget<LogoutCubit, LogoutResponseEntity>(
                successListener: (context, state) {
                  var data = state.data;
                  if (data != null) {
                    callFunction();
                    setState(() {});
                  }
                },
                successWidget: (c1, t1) => Container(),
                loadingWidgetBuilder: (c1, t1) => Container(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              decoration: BoxDecoration(
                color: LocalColors.CARD_BACKGROUND,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.account_circle, size: 50),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loginResponseEntity?.name?? "",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text(loginResponseEntity?.email?? "",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  )),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                _showLogoutDialog(context);
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: LocalColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Text(
                      Labels.LOG_OUT,
                      style: getButtonTextStyle(
                          textColor: LocalColors.ACCENT_COLOR, textSize: 20),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,color: LocalColors.WHITE,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Logout"),
          content: const Text(Labels.LOG_OUT_CONTENT,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(Labels.YES, () {
                  _logoutCubit.logout();
                })),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: PrimaryButton(
                  Labels.NO,
                  () {
                    Navigator.pop(context);
                  },
                  backGroundColor: LocalColors.ACCENT_COLOR,
                  textColor: LocalColors.PRIMARY_COLOR,
                ))
              ],
            ),
          ],
        );
      },
    );
  }

  void callFunction() async {
    await deleteTheSharedPreference(Constant.PREF_LOGIN_DATA);
    await deleteTheSharedPreference(Constant.PREF_AUTH_TOKEN);
    navigateToPageAndRemoveAllPageWithFadeTransition(
        context, const SignInScreen());
    setState(() {});
  }
}
