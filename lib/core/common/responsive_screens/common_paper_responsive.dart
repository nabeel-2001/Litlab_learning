import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litlab_learning/feature/auth/screens/login_page_web.dart';
import 'package:litlab_learning/feature/auth/screens/login_screen.dart';
import 'package:litlab_learning/feature/common_paper/screen/Common_Paper.dart';
import 'package:litlab_learning/feature/common_paper/screen/Common_Paper_Web.dart';
import 'package:litlab_learning/feature/courses/screen/course_screen.dart';
import 'package:litlab_learning/feature/courses/screen/course_screen_web.dart';


class CommonPaperResponsiveLayout extends StatelessWidget {
  const CommonPaperResponsiveLayout({super.key});
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
            return const CommonPaperScreen();
          } else {
            // For smaller screens, display Page2
            return const SelectPaper();
          }
        },
      ),
    );
  }
}