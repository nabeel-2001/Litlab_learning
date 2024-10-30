import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenWeb extends StatefulWidget {
  const SplashScreenWeb({super.key});

  @override
  State<SplashScreenWeb> createState() => _SplashScreenWebState();
}

class _SplashScreenWebState extends State<SplashScreenWeb> {
  Future<UserModel?> getUserFromHive() async {
    var box = await Hive.openBox('userBox');
    return box.get('currentUser') as UserModel?;
  }
  check() async {
   await getUserFromHive();
   UserModel? user = await getUserFromHive();

   if (user != null) {
     print(user?.id??"null");
     // User is already logged in, navigate to sidebar
     Navigator.pushReplacementNamed(context, 'sideBar_Page');
   } else {

     // Navigate to login
     Navigator.pushReplacementNamed(context, 'login_page');
   }
        Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login_page',(route) => false,));
  }
  @override
  void initState() {
    check();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.skyBlue,
        body: Center(
          child: SizedBox(
            width: scrWidth*0.6,

            child: Image.asset("assets/images/Logo.png",
            width: scrWidth*0.15,height: scrHeight*0.15,),
          ),
        ),
      );

  }
}

