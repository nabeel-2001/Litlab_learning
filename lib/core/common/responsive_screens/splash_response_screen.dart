import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/registeration_page.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen_web.dart';
class SplashResponsiveLayout extends StatefulWidget {
  const SplashResponsiveLayout({super.key});

  @override
  State<SplashResponsiveLayout> createState() => _SplashResponsiveLayoutState();
}

class _SplashResponsiveLayoutState extends State<SplashResponsiveLayout> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
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
            return SplashScreenWeb();
          } else {
            // For smaller screens, display Page2
            return SplashScreen();
          }
        },
      ),
    );
  }
}