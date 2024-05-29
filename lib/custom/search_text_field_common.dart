import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technikapp/custom/text_field_common.dart';

import '../common/label_keys.dart';
import '../common/local_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
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
  final SearchListener? searchListener;
  final ValueChanged<String>? changeListener;

  const SearchTextFieldWidget(this.textEditingController, this.currentFocusNode,
      {super.key,
      this.hintText = Labels.SEARCH,
      this.textInputType = TextInputType.text,
      this.formatters,
      this.textInputAction = TextInputAction.search,
      this.textCapitalization = TextCapitalization.words,
      this.isEnabled = true,
      this.maxLength = TextField.noMaxLength,
      this.nextFocusNode,
      this.searchListener,
      this.changeListener});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: formatters,
      enabled: isEnabled,
      autocorrect: false,
      controller: textEditingController,
      keyboardType: textInputType,
      onSubmitted: (text) {
        if (searchListener != null) searchListener!(text);
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      onChanged: changeListener,
      cursorColor: LocalColors.PRIMARY_COLOR,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      focusNode: currentFocusNode,
      style: getTextInputStyle(),
      decoration: getTextInputDecoration(hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: LocalColors.PRIMARY_COLOR,
          ),
          outlineInputBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: LocalColors.GREY),
              borderRadius: BorderRadius.circular(30))),
    );
  }
}

typedef SearchListener = void Function(String text);
