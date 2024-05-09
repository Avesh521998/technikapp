import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:technikapp/common/extensions_manager.dart';
import 'package:technikapp/common/shared_preference_helper.dart';
import '../api/model/response/login_response_entity.dart';
import '../generated/json/base/json_convert_content.dart';
import '../screens/dashboard/dash_board_screen.dart';
import '../screens/login/screens/login_screen.dart';
import 'constants.dart';
import 'navigation_manager.dart';

void goToMainScreenFromOnboarding(BuildContext context, LoginResponseEntity signInResponseEntity) async{
  print("Access token");
  print(signInResponseEntity.authKey);
  await savePreferenceValue(Constant.PREF_AUTH_TOKEN, signInResponseEntity.authKey);
  await savePreferenceValue(Constant.PREF_LOGIN_DATA, json.encode(signInResponseEntity.toJson()));
  await savePreferenceValue(Constant.PREF_LOGIN_BOOL, true);
  //Updating the notification manager class with latest sign in data so that push notification can be maintained
  //NotificationManager.instance.updateUserSignIn(signInResponseEntity);
  goToMainScreenManager(context, signInResponseEntity);
}

void goToMainScreenManager(
    BuildContext context, LoginResponseEntity signInResponseEntity) {
  if (signInResponseEntity.authKey !=null) {
    print("Token is ");
    navigateToPageAndRemoveAllPage(
        context, const DashBoardScreen());
  } else {
    print("token is empty");
    navigateToPage(context, const SignInScreen());
  }
}

Future<LoginResponseEntity?> getUserPreferenceData() async {
  var preferenceValue = await getPreferenceValue(Constant.PREF_LOGIN_DATA, "");
  if (preferenceValue.isNullOrEmpty()) return null;
  var decode = json.decode(preferenceValue);
  LoginResponseEntity? signInResponseData = JsonConvert.fromJsonAsT(decode);
  return signInResponseData;
}


void saveUserPreferenceData(LoginResponseEntity signInResponseEntity) {
  savePreferenceValue(
      Constant.PREF_LOGIN_DATA, json.encode(signInResponseEntity.toJson()));
}


