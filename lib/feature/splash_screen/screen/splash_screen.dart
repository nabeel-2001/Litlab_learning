import 'package:flutter/material.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onboarding_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnboardingScreen1(),), (route) => false,),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: Center(
        child: SizedBox(
          width: scrWidth*0.6,

          child: Image.asset("assets/images/Logo.png"),
        ),
      ),
    );
  }
}
