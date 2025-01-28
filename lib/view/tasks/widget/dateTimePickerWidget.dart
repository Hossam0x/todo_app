import 'package:flutter/material.dart';
import 'package:todo_app/view/tasks/widget/time_picker.dart';

class DateTimePickerWidget extends StatelessWidget {
  final void Function(DateTime dateTime, String formattedDate)? onConfirm;

  DateTimePickerWidget({
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return TimePickerWidget(
      onChanged: (columnIndex, selectedValue) {
        print("Column: $columnIndex, Value: $selectedValue");
      },
      onConfirm: (dateTime, formattedDate) {
        if (onConfirm != null) {
          onConfirm!(dateTime, formattedDate);
        }
      },
      dateFormat: 'yyyy-MM-dd', // تم تعديل التنسيق هنا لعرض التاريخ
    );
  }
}
