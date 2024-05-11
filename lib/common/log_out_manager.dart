import 'package:flutter/material.dart';
import 'package:technikapp/common/shared_preference_helper.dart';
import '../api/api_helper.dart';
import '../screens/login/screens/login_screen.dart';
import 'constants.dart';
import 'navigation_manager.dart';

class LogoutManager {
  static void logOutUser(BuildContext context,
      {Widget? currentWidget, Widget? redirectTo}) async {

    
    APIHelper.instance.makeHeaderNull();
    await deleteTheSharedPreference(Constant.PREF_LOGIN_DATA);
    await deleteTheSharedPreference(Constant.PREF_AUTH_TOKEN);
    await deleteTheSharedPreference(Constant.GET_TOTAL);

   //NotificationManager.instance.updateUserSignIn(null);
 //  NotificationManager.instance.cancelAllNotification();
    if (redirectTo != null) {
      navigateToPageAndRemoveAllPageWithFadeTransition(context,redirectTo,
          currentWidget: currentWidget);
    } else {
      navigateToPageAndRemoveAllPageWithFadeTransition(context,SignInScreen(),
          currentWidget: currentWidget);
    }
  }
}
