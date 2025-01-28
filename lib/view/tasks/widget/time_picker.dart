import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatelessWidget {
  final void Function(int columnIndex, int selectedValue)? onChanged;
  final String? dateFormat;
  final void Function(DateTime dateTime, String formattedDate)? onConfirm;

  TimePickerWidget({
    this.onChanged,
    this.dateFormat,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  if (onConfirm != null) {
                    final dateTime = DateTime
                        .now(); // Replace with actual selected date-time
                    final formattedDate =
                        dateFormat ?? 'yyyy-MM-dd'; // Default to date format
                    onConfirm!(dateTime, formattedDate);
                  }
                  Navigator.pop(context);
                },
                child: Text("Done"),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select Date"),
                SizedBox(height: 20),
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date, // Show date picker
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    if (onChanged != null) {
                      // Optional: Handle date changes
                      onChanged!(
                          0,
                          newDateTime
                              .day); // Example, can adjust according to requirements
                    }
                    if (onConfirm != null) {
                      final formattedDate = newDateTime
                          .toIso8601String()
                          .split('T')
                          .first; // Format the date
                      onConfirm!(newDateTime, formattedDate);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
