import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/side_bar.dart';

import 'package:litlab_learning/feature/courses/screen/course_screen.dart';
import 'package:litlab_learning/feature/courses/screen/course_screen_web.dart';


class SideBarResponsiveLayout extends StatelessWidget {
  const SideBarResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Get the available width from the BoxConstraints
          double screenWidth = constraints.maxWidth;

          // Set a threshold for mobile and larger screens (e.g., 600.0)
          if (screenWidth > 600) {
            // For larger screens, display Page1
            return const SideBarPage();
          } else {
            // For smaller screens, display Page2
            return const BottomNavScreen();
          }
        },
      ),
    );
  }
}