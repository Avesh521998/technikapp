import 'package:flutter/material.dart';
import 'package:technikapp/common/extensions_manager.dart';

import '../common/asset_manager.dart';
import '../common/constants.dart';
import '../common/label_keys.dart';
import 'button_common.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorLabel;
  final bool needToShowRetry;
  final VoidCallback? callback;
  final bool showInsideList;

  CustomErrorWidget(
      this.errorLabel, {super.key,
        this.callback,
        this.needToShowRetry = false,
        this.showInsideList = true,
      }) {
    if (needToShowRetry && callback == null) {
      throw Labels.IF_RETRY_ENABLED_NEED_CALLBACK;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showInsideList) {
      return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: _getErrorContents(context),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getErrorContents(context),
      );
    }
  }

  _getErrorContents(BuildContext context) {
    return [
      const SizedBox(
        height: 20,
      ),
      Text(
        errorLabel.orEmpty(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontAsset.MEDIUM),
      ),
      const SizedBox(
        height: 20,
      ),
      if (needToShowRetry)
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constant.COMMON_PADDING_FOR_SCREEN),
          child: PrimaryButton(Labels.RETRY, () {
            if (callback != null) Function.apply(callback!, []);
          }),
        ),
    ];
  }
}
