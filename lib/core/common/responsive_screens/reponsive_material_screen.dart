import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litlab_learning/feature/auth/screens/register_page_web.dart';
import 'package:litlab_learning/feature/auth/screens/registeration_page.dart';
import 'package:litlab_learning/feature/materials/screen/material_Page.dart';
import 'package:litlab_learning/feature/materials/screen/material_page_web.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen_web.dart';

class MaterialPageResponsive extends StatelessWidget {
  const MaterialPageResponsive({super.key});

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
            return const MaterialPageWeb();
          } else {
            // For smaller screens, display Page2
            return const MaterialScreen();
          }
        },
      ),
    );
  }
}