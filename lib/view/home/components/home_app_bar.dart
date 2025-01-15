import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeApppBar extends StatefulWidget {
  const HomeApppBar({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerState> drawerKey;
  @override
  State<HomeApppBar> createState() => _HomeApppBarState();
}

class _HomeApppBarState extends State<HomeApppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onDrawerToggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animationController.forward();
        widget.drawerKey.currentState!.openSlider();
      } else {
        animationController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                  onPressed: onDrawerToggle,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: animationController)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.trash_fill,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
