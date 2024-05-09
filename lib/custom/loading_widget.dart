import 'package:flutter/material.dart';

import '../common/local_colors.dart';
class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;

  const LoadingWidget({this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          color: LocalColors.PRIMARY_COLOR,

        ),
      ),
    );
  }
}
