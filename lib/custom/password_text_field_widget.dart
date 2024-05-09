import 'package:flutter/material.dart';
import 'package:technikapp/custom/text_field_common.dart';
import '../common/local_colors.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintTextKey;
  final FocusNode currentFocusNode;
  final TextInputAction textInputAction;
  final bool isEnabled;
  final FocusNode? nextFocusNode;

  const PasswordTextFieldWidget(
      this.textEditingController, this.hintTextKey, this.currentFocusNode,
      {this.textInputAction = TextInputAction.next,
      this.isEnabled = true,
      this.nextFocusNode});

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _needToHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LocalColors.ACCENT_COLOR,
      child: TextField(
        enabled: widget.isEnabled,
        autocorrect: false,
        controller: widget.textEditingController,
        onSubmitted: (text) {
          if (widget.nextFocusNode != null)
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
        },
        cursorColor: LocalColors.PRIMARY_COLOR,
        textInputAction: widget.textInputAction,
        focusNode: widget.currentFocusNode,
        obscureText: _needToHidePassword,
        style: getTextInputStyle(),
        decoration: getTextInputDecoration(widget.hintTextKey,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _needToHidePassword = !_needToHidePassword;
                });
              },
              child: Icon(
                _needToHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: LocalColors.PRIMARY_COLOR, //<-- SEE HERE
              ),
            )),
      ),
    );
  }
}
