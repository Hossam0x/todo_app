import 'package:flutter/material.dart';
import 'package:todo_app/view/home/home_view.dart';
import 'package:todo_app/view/tasks/task_view.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
