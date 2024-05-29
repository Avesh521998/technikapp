import 'package:flutter/material.dart';

import '../common/asset_manager.dart';
import '../common/local_colors.dart';

class UnderLineTextWidget extends StatelessWidget {
  final String titleKey;
  final VoidCallback onTap;
  final Color textColor;
  final double? textSize;

  const UnderLineTextWidget(this.titleKey, this.onTap,
      {super.key, this.textColor = LocalColors.PRIMARY_COLOR, this.textSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        titleKey,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: textSize ?? 12,
            fontWeight: FontAsset.BOLD,
            color: textColor,
            decoration: TextDecoration.underline),
      ),
    );
  }
}

