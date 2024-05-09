import 'package:flutter/material.dart';
import '../common/asset_manager.dart';
import '../common/date_time_manager.dart';
import '../common/local_colors.dart';

class DateTextFieldWidget extends StatefulWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  final FocusNode _currentFocusNode;
  final FocusNode? nextFocusNode;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? preSelectedDate;
  final DateSelectionListener? dateSelectionListener;

  const DateTextFieldWidget(
      this._textEditingController, this._hintText, this._currentFocusNode,
      {this.nextFocusNode,
      this.firstDate,
      this.lastDate,
      this.preSelectedDate,
      this.dateSelectionListener});

  @override
  _DateTextFieldWidgetState createState() => _DateTextFieldWidgetState();
}

class _DateTextFieldWidgetState extends State<DateTextFieldWidget> {
  DateTime _selectedDateTime = DateTime.now();

  late DateTime _firstDate;
  late DateTime _lastDate;

  @override
  void initState() {
    super.initState();
    if (widget.firstDate != null)
      _firstDate = widget.firstDate!;
    else
      _firstDate = DateTime(1950);

    if (widget.lastDate != null)
      _lastDate = widget.lastDate!;
    else
      _lastDate = DateTime(2100);

    if (widget.preSelectedDate != null) {
      _selectedDateTime = widget.preSelectedDate!;
    }
    print(_lastDate);
   // assertSelectedDate();
  }

  void assertSelectedDate() {
    print("------->");
    print(_selectedDateTime);
    if (!_selectedDateTime.isBefore(_lastDate) ||
        !_selectedDateTime.isAfter(_firstDate)) {
      if (_checkCurrentDateInsideRange()) {
        _selectedDateTime = DateTime.now();
        print("if------->");
        print(_selectedDateTime);
      } else {
        _selectedDateTime = _lastDate;
        print("else------->");
        print(_selectedDateTime);
      }
    }
  }

  bool _checkCurrentDateInsideRange() {
    var currentDate = DateTime.now();
    return currentDate.isBefore(_lastDate) && currentDate.isAfter(_firstDate);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDatePickerDialog();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
            enabled: false,
            autocorrect: false,
            controller: widget._textEditingController,
            cursorColor: LocalColors.PRIMARY_COLOR,
            focusNode: widget._currentFocusNode,
            style: const TextStyle(
              fontFamily: FontAsset.MONTSERRAT,
              fontSize: 15,
              fontWeight: FontAsset.MEDIUM,
              color: LocalColors.PRIMARY_COLOR,
            ),
            decoration:
                getCalendarTextWidgetScreenInputDecoration(widget._hintText,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Icon(
                        Icons.calendar_month,
                        color: LocalColors.PRIMARY_COLOR,
                      ),
                    ))),
      ),
    );
  }

  Future<void> _showDatePickerDialog() async {
    DateTime firstDate = _firstDate;
    DateTime lastDate = _lastDate;
    DateTime initialDate = _selectedDateTime;

    FocusScope.of(context).requestFocus(widget._currentFocusNode);

    var selectedDateTime = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        helpText: widget._hintText,builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme:  const ColorScheme.light(
            primary: LocalColors.BOTTON_SELECTED,
            onPrimary: LocalColors.ACCENT_COLOR,
            onSurface: LocalColors.BOTTON_SELECTED,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: LocalColors.BOTTON_SELECTED, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },);

    if (selectedDateTime != null) {
      setState(() {
        _selectedDateTime = selectedDateTime;
        widget._textEditingController.text = DateTimeUtil.formatDate(
            _selectedDateTime,
            formatPattern: DateTimeUtil.FORMAT_DD_MMM_YYYY);
        if (widget.dateSelectionListener != null)
          widget.dateSelectionListener!(selectedDateTime);
        if (widget.nextFocusNode != null)
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
      });
    }
  }
}
InputDecoration getCalendarTextWidgetScreenInputDecoration(String hintText,
    {Widget? prefixIcon, Widget? suffixIcon, Widget? prefix, Widget? suffix}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 10,left: 10),
      hintText: hintText,
      hintStyle: const TextStyle(color: LocalColors.PRIMARY_COLOR),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: getTextInputBorder(),
      border: getTextInputBorder(),
      disabledBorder: getTextInputBorder(),
      enabledBorder: getTextInputBorder(),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefix: prefix,
      suffix: suffix);
}

OutlineInputBorder getTextInputBorder({color = LocalColors.PRIMARY_COLOR}) {
  return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10));
}

typedef DateSelectionListener = void Function(DateTime selectedDate);