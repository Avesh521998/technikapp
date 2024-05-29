import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technikapp/custom/snackbar_common.dart';
import '../api/base/api_result.dart';
import '../api/network_constants.dart';
import '../common/asset_manager.dart';
import '../common/constants.dart';
import '../common/extensions_manager.dart';
import '../common/local_colors.dart';
import '../common/log_out_manager.dart';
import '../screens/login/screens/login_screen.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonLabel;
  final Function voidCallBack;
  final double? fontSize;
  final Color backGroundColor;
  final Color borderColor;
  final Color textColor;
  final bool requiredFullWidth;
  final double? borderRadiusSize;

  const PrimaryButton(this.buttonLabel, this.voidCallBack,
      {super.key,
      this.fontSize,
      this.backGroundColor = LocalColors.PRIMARY_COLOR,
      this.borderColor = LocalColors.PRIMARY_COLOR,
      this.textColor = LocalColors.ACCENT_COLOR,
      this.requiredFullWidth = false,
      this.borderRadiusSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(
                borderRadiusSize ?? Constant.COMMON_RADIUS_FOR_WIDGETS))),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backGroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(
                      borderRadiusSize ??
                          Constant.COMMON_RADIUS_FOR_BUTTONS)))),
          child: Text(
            buttonLabel,
            style: getButtonTextStyle(textColor: textColor, textSize: fontSize),
          ),
          onPressed: () {
            Function.apply(voidCallBack, []);
          },
        ),
      ),
    );
  }
}

class PrimaryOutLineIconButton extends StatelessWidget {
  final String buttonLabel;
  final Function voidCallBack;
  final double? fontSize;
  final Color backGroundColor;
  final Color borderColor;
  final Color textColor;
  final Widget iconWidget;

  const PrimaryOutLineIconButton(
      this.buttonLabel, this.iconWidget, this.voidCallBack,
      {super.key,
      this.fontSize,
      this.backGroundColor = LocalColors.PRIMARY_COLOR,
      this.borderColor = LocalColors.PRIMARY_COLOR,
      this.textColor = LocalColors.ACCENT_COLOR});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.COMMON_RADIUS_FOR_BUTTONS)))),
        label: Text(
          buttonLabel,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: getButtonTextStyle(textColor: textColor, textSize: fontSize),
        ),
        icon: iconWidget,
        onPressed: () {
          Function.apply(voidCallBack, []);
        },
      ),
    );
  }
}

class BlocConsumerButtonWithProgress<E extends Cubit<APIResult<T>?>, T>
    extends StatelessWidget {
  final String buttonLabel;
  final void Function() onTap;
  final void Function(T result, String successMessage) onSuccess;
  final void Function(String errorMessage)? onError;
  final void Function()? onNoInternet;
  final bool needToShowDefaultSuccessSnackBar;
  final bool needToShowDefaultErrorSnackBar;
  final bool isEnabled;
  final Color backGroundColor;
  final Color borderColor;
  final Color textColor;
  final Color progressColor;
  final double? textSize;

  BlocConsumerButtonWithProgress(this.buttonLabel, this.onTap, this.onSuccess,
      {super.key,
      this.onError,
      this.onNoInternet,
      this.needToShowDefaultSuccessSnackBar = false,
      this.needToShowDefaultErrorSnackBar = true,
      this.isEnabled = true,
      this.backGroundColor = LocalColors.PRIMARY_COLOR,
      this.borderColor = LocalColors.PRIMARY_COLOR,
      this.progressColor = LocalColors.ACCENT_COLOR,
      this.textColor = LocalColors.ACCENT_COLOR,
      this.textSize})
      : assert(T != dynamic);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<E, APIResult<T>?>(
      listener: (BuildContext context, APIResult<T>? value) {
        if (value != null) {
          if (value.apiResultType == APIResultType.NO_INTERNET) {
            _showToastMessage(context, value.message);
            if (onNoInternet != null) Function.apply(onNoInternet!, []);
          } else if (value.apiResultType == APIResultType.FAILURE) {
            if (needToShowDefaultErrorSnackBar) {
              _showToastMessage(context, "Please enter valid email or password");
            }
            if (onError != null) {
              Function.apply(onError!, [orEmpty(value.message)]);
            }
          } else if (value.apiResultType == APIResultType.SESSION_EXPIRED) {
            LogoutManager.logOutUser(context,
                currentWidget: const SignInScreen());
          } else if (value.apiResultType == APIResultType.SUCCESS) {
            if (needToShowDefaultSuccessSnackBar) {
              _showToastMessage(context, value.message);
            }
            if (value.data != null) {
              Function.apply(onSuccess, [value.data, value.message]);
            }
          }
        }
      },
      builder: (BuildContext context, APIResult<T>? value) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(Constant.COMMON_RADIUS_FOR_BUTTONS)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    LocalColors.BUTTON_COLOR,
                    LocalColors.BUTTON_COLOR
                  ])),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: LocalColors.TRANSPARENT,
              elevation: 0,
            ),
            onPressed: isEnabled
                ? () {
                    if ((value == null ||
                        value.apiResultType != APIResultType.LOADING)) {
                      Function.apply(onTap, []);
                    }
                  }
                : null,
            child: APIResult.isLoading(value)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(progressColor),
                          )),
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        buttonLabel,
                        style: getButtonTextStyle(
                            textColor: textColor, textSize: textSize),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,color: LocalColors.WHITE,)
                    ],
                  ),
          ),
        );
      },
    );
  }

  void _showToastMessage(BuildContext context, String? message) {
    if (message.isNullOrEmpty()) return;
    try {
      showSnackBar(context, message!);
    } catch (e) {
      showFlushBar(context, message!);
    }
  }
}

TextStyle getButtonTextStyle(
    {Color textColor = LocalColors.ACCENT_COLOR, double? textSize}) {
  return TextStyle(
      fontSize: textSize ?? 20, fontWeight: FontAsset.BLACK, color: textColor);
}

class PickerButton extends StatelessWidget {
  final String labelKey;
  final IconData icons;
  final Function() voidCallBack;

  //Used in the image picker.
  const PickerButton(this.labelKey, this.icons, this.voidCallBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          labelKey,
          voidCallBack,
          backGroundColor: LocalColors.PRIMARY_COLOR,
          borderColor: LocalColors.PRIMARY_COLOR,
        ),
        SizedBox(
          height: Constant.COMMON_PADDING_FOR_SCREEN,
        ),
      ],
    );
  }
}
