import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/view/tasks/task_view.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskView()));
      },
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 10,
        child: Container(
          width: 70,
          height: 70,
          decoration:  BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}