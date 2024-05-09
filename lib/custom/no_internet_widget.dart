import 'package:flutter/material.dart';
import '../common/asset_manager.dart';
import '../common/constants.dart';
import '../common/label_keys.dart';
import '../common/local_colors.dart';
import 'button_common.dart';

class NoInternetWidget extends StatelessWidget {
  final bool needToShowRetry;
  final VoidCallback? callback;
  final bool needPadding;

  NoInternetWidget(
      {super.key, this.callback, this.needToShowRetry = false, this.needPadding = false}) {
    if (needToShowRetry && callback == null) {
      throw Labels.IF_RETRY_ENABLED_NEED_CALLBACK;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: needPadding
          ? EdgeInsets.all(Constant.COMMON_PADDING_FOR_SCREEN)
          : EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        /*Image(
          image: const AssetImage(ImageAsset.IC_NO_INTERNET),
          width: Dimensions.w150,
          height: Dimensions.w150,
        ),*/
        SizedBox(
          height: 15,
        ),
        Text(
          Labels.NO_INTERNET_CONNECTION,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontAsset.MEDIUM,
              color: LocalColors.PRIMARY_COLOR),
        ),
        SizedBox(
          height: 20,
        ),
        if (needToShowRetry)
          PrimaryButton(Labels.RETRY, () {
            if (callback != null) Function.apply(callback!, []);
          }),
      ],
    );
  }
}
