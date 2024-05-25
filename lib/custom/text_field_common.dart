import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/asset_manager.dart';
import '../common/constants.dart';
import '../common/local_colors.dart';

/// This is common widget to create the text-field which is common in this application
/// Any change in this method should be also reflected in All the text field widgets.
/// All of these are share the same styles and theme and everything.
class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FocusNode currentFocusNode;
  final TextInputType textInputType;
  final List<TextInputFormatter>? formatters;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final bool isEnabled;
  final int maxLength;
  final FocusNode? nextFocusNode;
  final int? maxLine;
  final int? minLine;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final OutlineInputBorder? outlineInputBorder;
  final ValueChanged<String>? changeListener;
  final Color? textBackGround;
  const TextFieldWidget(
      this.textEditingController, this.hintText, this.currentFocusNode,
      {super.key, this.textInputType = TextInputType.text,
      this.formatters,
      this.textInputAction = TextInputAction.next,
      this.textCapitalization = TextCapitalization.sentences,
      this.isEnabled = true,
      this.maxLength = TextField.noMaxLength,
      this.nextFocusNode,
      this.maxLine = 1,
      this.minLine = 1,
      this.prefix,
      this.suffix,
      this.prefixIcon,
      this.suffixIcon,this.autoFocus,this.changeListener,this.outlineInputBorder,this.textBackGround});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textBackGround ?? LocalColors.ACCENT_COLOR,
      child: TextField(
        maxLines: maxLine,
        minLines: minLine,
        autofocus: autoFocus ?? false,
        inputFormatters: formatters,
        enabled: isEnabled,
        autocorrect: false,
        maxLength: maxLength,
        onChanged: changeListener,
        controller: textEditingController,
        buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) =>
            null,
        keyboardType: textInputType,
        onSubmitted: (text) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        cursorColor: LocalColors.PRIMARY_COLOR,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        focusNode: currentFocusNode,
        style: getTextInputStyle(),
        decoration: getTextInputDecoration(hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefix: prefix,
            suffix: suffix,outlineInputBorder: outlineInputBorder),
      ),
    );
  }
}

TextStyle getTextInputStyle() {
  return const TextStyle(
      fontSize: 16,
      fontWeight: FontAsset.MEDIUM,);
}

InputDecoration getTextInputDecoration(String hintText,
    {Widget? prefixIcon, Widget? suffixIcon, Widget? prefix, Widget? suffix,OutlineInputBorder? outlineInputBorder,double? padding}) {
  return InputDecoration(
      labelText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder:outlineInputBorder ?? getTextInputBorder(),
      border:outlineInputBorder ?? getTextInputBorder(),
      disabledBorder:outlineInputBorder ?? getTextInputBorder(),
      enabledBorder: outlineInputBorder ?? getTextInputBorder(),
      contentPadding: EdgeInsets.only(
          top: padding??17,
          bottom: padding??17,
          left: padding??16,
          right: padding??16),
      labelStyle: const TextStyle(
          fontWeight: FontAsset.REGULAR,
          color: LocalColors.PRIMARY_COLOR,
          fontSize: 16,),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefix: prefix,
      suffix: suffix);
}

OutlineInputBorder getTextInputBorder({color = LocalColors.GREY}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(Constant.COMMON_RADIUS_FOR_WIDGETS));
}
OutlineInputBorder getTextInputBorders({color = LocalColors.GREY}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(Constant.COMMON_RADIUS_FOR_WIDGETS));
}
