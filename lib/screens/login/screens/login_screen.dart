import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/model/response/login_response_entity.dart';
import '../../../../common/asset_manager.dart';
import '../../../../custom/snackbar_common.dart';
import '../../../api/model/request/login_request_entity.dart';
import '../../../common/label_keys.dart';
import '../../../common/local_colors.dart';
import '../../../common/user_state_manager.dart';
import '../../../custom/button_common.dart';
import '../../../custom/password_text_field_widget.dart';
import '../../../custom/text_field_common.dart';
import '../cubit/login_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final SignInCubit _loginCubit = SignInCubit();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberMe') ?? false) {
      setState(() {
        emailController.text = prefs.getString('email') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
        rememberMe = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: Scaffold(
        backgroundColor: LocalColors.LOGIN_BACKGROUND,
        body: ListView(
          children: [
            Image.asset(ImageAsset.IC_SPLASH_LOGO, height: MediaQuery.of(context).size.width * 1.1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Labels.LOG_IN,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontAsset.BOLD)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(Labels.LOG_IN_CONTENT,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontAsset.MEDIUM)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(emailController, Labels.USERNAME, emailFocusNode,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextFieldWidget(
                      passwordController, Labels.PASSWORD, passwordFocusNode,
                      textInputAction: TextInputAction.done),
                  const SizedBox(height: 20,),
                  BlocConsumerButtonWithProgress<SignInCubit,
                          LoginResponseEntity>(Labels.LOG_IN, _onSignInClick,
                      _goToDashBoardScreenScreen),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goToDashBoardScreenScreen(
      LoginResponseEntity signInResponseEntity, String message) async {
    goToMainScreenFromOnboarding(context, signInResponseEntity);
  }

  void _onSignInClick() async {
    if (_isDataValid()) {
      var email = emailController.text;
      var password = passwordController.text;
      var otpSendRequestEntity = LoginRequestEntity()
        ..username = email
        ..password = password;
      _loginCubit.callLoginAPI(otpSendRequestEntity);
    }
  }

  bool _isDataValid() {
    String errorText = "";

    var email = emailController.text;
    var password = passwordController.text;

    if (email.isEmpty) {
      errorText = ValidationLabels.EMAIL_VALIDATION;
    } else if (password.isEmpty) {
      errorText = ValidationLabels.PASSOWRD_VALIDATION;
    }

    if (errorText.isNotEmpty) {
      showSnackBar(context, errorText);
      return false;
    } else {
      hideSnackBar(context);
      return true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
