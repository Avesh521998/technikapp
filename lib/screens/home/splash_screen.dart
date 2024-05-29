import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:technikapp/common/shared_preference_helper.dart';
import 'package:technikapp/screens/login/screens/login_screen.dart';

import '../../api/model/response/login_response_entity.dart';
import '../../common/asset_manager.dart';
import '../../common/constants.dart';
import '../../common/navigation_manager.dart';
import '../dashboard/dash_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer splashTimer;

  @override
  void initState() {
    super.initState();
    splashTimer = Timer(const Duration(milliseconds: 3000), () {
      checkScreenNavigation();
    });
  }

  void checkScreenNavigation() async {
    String signInResponse = await getPreferenceValue(Constant.PREF_LOGIN_DATA, "");
    if(signInResponse.isNotEmpty){
      var decode = json.decode(signInResponse);
      var loginResponseEntity = LoginResponseEntity.fromJson(decode);

      if (loginResponseEntity.authKey != null) {
        _goToDashBoardScreen();
      }
    } else {
      navigateToPageAndRemoveAllPageWithFadeTransition(context, const SignInScreen(),
          currentWidget: widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getSplashScreen();
  }

  Widget _getSplashScreen() {
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 125,
        width: 125,
        child: CircleAvatar(
          radius: 50,
          child: ClipOval(child: Image.asset(ImageAsset.IC_SPLASH_LOGO)),
        ),
      ),
    ));
  }

  Future<void> _goToDashBoardScreen() async {
    navigateToPageAndRemoveAllPageWithFadeTransition(
        context, const DashBoardScreen(),
        currentWidget: widget);
  }

  Future<String> checkForSignInResponse() async {
    var loginData = getPreferenceValue(Constant.PREF_LOGIN_DATA, "");
    return loginData;
  }
}
