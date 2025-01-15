import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/constants.dart';
import 'package:todo_app/utils/strings.dart';
import 'package:todo_app/view/home/widgets/fab.dart';
import 'package:todo_app/view/home/widgets/task_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> testing = [1];
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const Fab(),
      body: _builderHomeBody(theme: theme, testing: testing),
    );
  }
}

class _builderHomeBody extends StatelessWidget {
  const _builderHomeBody({
    super.key,
    required this.theme,
    required this.testing,
  });

  final TextTheme theme;
  final List<int> testing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // progress indicator
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation(MyColors.primaryColor),
                    ),
                  ),
                  25.w,
                  // Tap level task info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyString.mainTitle,
                        style: theme.displayLarge,
                      ),
                      3.h,
                      Text(
                        "1 of 3 task",
                        style: theme.titleMedium,
                      )
                    ],
                  )
                ],
              ),
            ),
            // divider
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            )
    
            // tasks
            ,
            SizedBox(
                width: double.infinity,
                height: 745,
                child: testing.isNotEmpty
                    ? ListView.builder(
                        itemCount: testing.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              direction: DismissDirection.horizontal,
                              onDismissed: (direction) {
                                // remove current task from DB
                              },
                              background: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    MyString.deleteTask,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              key: Key(index.toString()),
                              child: const TaskWidget());
                        })
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeIn(
                            child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Lottie.asset(lottieUrl,
                                    animate:
                                        testing.isNotEmpty ? false : true)),
                          ),
                          FadeInUp(
                              from: 30,
                              child: const Text(MyString.doneAllTask)),
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}
