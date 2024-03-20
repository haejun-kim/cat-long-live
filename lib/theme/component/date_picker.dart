import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.type,
    this.initialDate,
    this.onBirthdaySelected,
  });

  final ButtonType? type;
  final DateTime? initialDate; // 새로 추가된 initialDate 속성
  final Function(DateTime)? onBirthdaySelected;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      date = widget.initialDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      type: widget.type,
      icon: "material-calendar",
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          confirmText: "확인",
          cancelText: "취소",
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: context.color.primary, // header background color
                  onPrimary: context.color.onPrimary, // header text color
                  onSurface: context.color.text, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: context.color.primary, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (selectedDate != null) {
          setState(() {
            date = selectedDate;
          });
          widget.onBirthdaySelected!(selectedDate);
        }
      },
      text:
          "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    );
  }
}
