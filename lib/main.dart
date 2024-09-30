import 'package:flutter/material.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen.dart';
import 'package:litlab_learning/feature/home/screen/home.dart';
import 'core/local/local_variables.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return const MaterialApp(
debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}

