import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:technikapp/custom/text_field_common.dart';
import '../common/local_colors.dart';

class EmailTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FocusNode currentFocusNode;
  final TextInputAction textInputAction;
  final bool isEnabled;
  final FocusNode? nextFocusNode;

  const EmailTextFieldWidget(
      this.textEditingController, this.hintText, this.currentFocusNode,
      {super.key, this.textInputAction = TextInputAction.next,
      this.isEnabled = true,
      this.nextFocusNode});

  @override
  _EmailTextFieldWidgetState createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  bool _isEmailOK = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: widget.isEnabled,
        autocorrect: false,
        controller: widget.textEditingController,
        keyboardType: TextInputType.emailAddress,
        onChanged: (text) {
          setState(() {
            _isEmailOK = EmailValidator.validate(text);
          });
        },
        onSubmitted: (text) {
          if (widget.nextFocusNode != null)
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
        },
        cursorColor: LocalColors.PRIMARY_COLOR,
        textInputAction: widget.textInputAction,
        focusNode: widget.currentFocusNode,
        style: getTextInputStyle(),
        decoration: getTextInputDecoration(widget.hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Visibility(
                  visible: _isEmailOK,
                  child: const Icon(
                    Icons.check,
                    color: LocalColors.PRIMARY_COLOR,
                  )),
            )));
  }
}
