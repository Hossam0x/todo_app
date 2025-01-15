import 'package:flutter/material.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/strings.dart';
import 'package:todo_app/view/tasks/widget/task_view_app_bar.dart';

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
        appBar: TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSizeText(),
                SizedBox(
                  width: double.infinity,
                  height: 530,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          MyString.titleOfTitleTextField,
                        ),
                      ),
                      repTextField(controller: titleTaskController),
                      10.h,
                      repTextField(controller: descriptionTaskController , isForDescription: true,),
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

class repTextField extends StatelessWidget {
  const repTextField({
    super.key,
    required this.controller, this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: 6,
          cursorHeight: 60,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
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
