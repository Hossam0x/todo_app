import 'package:flutter/material.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/strings.dart';
import 'package:todo_app/view/tasks/components/rep_textfield.dart';
import 'package:todo_app/view/tasks/widget/dateTimePickerWidget.dart';
import 'package:todo_app/view/tasks/widget/task_view_app_bar.dart';
import 'package:todo_app/view/tasks/widget/time_picker.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: const TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _buildTopSizeText(),
                SizedBox(
                  width: double.infinity,
                  height: 530,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          MyString.titleOfTitleTextField,
                        ),
                      ),
                      repTextField(controller: titleTaskController),
                      10.h,
                      repTextField(
                        controller: descriptionTaskController,
                        isForDescription: true,
                      ),
                      //time selection
                      DateTimeSelection(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                    height: 200,
                                    child: TimePickerWidget(
                                        onChanged: (_, __) {},
                                        dateFormat: 'HH:mm',
                                        onConfirm: (dateTime, _) {}),
                                  ));
                        },
                        title: MyString.timeString,
                      ),
                      DateTimeSelection(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => SizedBox(
                              height: 300,
                              child: DateTimePickerWidget(
                                onConfirm: (dateTime, formattedDate) {
                                  print('Selected Time: $formattedDate');
                                },
                              ),
                            ),
                          );
                        },
                        title: MyString.dateString,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                title,
              ),
            ),
            Container(
              width: 80,
              margin: EdgeInsets.only(right: 10),
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: const Center(
                child: Text("Time"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _buildTopSizeText extends StatelessWidget {
  const _buildTopSizeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
              text: const TextSpan(
                  text: MyString.addNewTask,
                  style: TextStyle(fontSize: 40, color: Colors.black),
                  children: [
                TextSpan(
                    text: MyString.taskStrnig,
                    style: TextStyle(fontWeight: FontWeight.w400))
              ])),
          const SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
