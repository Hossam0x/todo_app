import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
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