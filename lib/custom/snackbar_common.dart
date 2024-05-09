import 'package:flutter/material.dart';
import '../common/asset_manager.dart';
import '../common/local_colors.dart';
import 'package:another_flushbar/flushbar.dart';

void showSnackBar(BuildContext context, String text) {
  hideSnackBar(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    content: Text(
      text,
      style: const TextStyle(
        fontWeight: FontAsset.REGULAR,
      ),
    ),
  ));
}

void hideSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}

void showFlushBar(BuildContext context, String text, {Function? onDismiss,FlushbarPosition? position,Color? background}) {
  Flushbar(
    backgroundColor: background ?? LocalColors.PRIMARY_COLOR,
    flushbarPosition: position ?? FlushbarPosition.BOTTOM,
    margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
    borderRadius: const BorderRadius.all(Radius.circular(6)),
    padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
    isDismissible: false,
    onStatusChanged: (status) {
      if (status == FlushbarStatus.DISMISSED && onDismiss != null) {
        Function.apply(onDismiss, null);
      }
    },
    forwardAnimationCurve: Curves.linear,
    reverseAnimationCurve: Curves.linear,
    duration: const Duration(seconds: 4),
    animationDuration: const Duration(milliseconds: 250),
    messageText: Text(
      text,
      style: const TextStyle(
          fontWeight: FontAsset.REGULAR, color: LocalColors.WHITE),
    ),
  ).show(context);
}
