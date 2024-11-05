import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/firebase_constant.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;
class SplashScreenWeb extends StatefulWidget {
  const SplashScreenWeb({super.key});

  @override
  State<SplashScreenWeb> createState() => _SplashScreenWebState();
}

class _SplashScreenWebState extends State<SplashScreenWeb> {
  getVersion() async {
    var data = await FirebaseFirestore.instance
        .collection(FirebaseConstants.settings)
        .doc(FirebaseConstants.settings)
        .get();
    setState(() {
      String DBversion = data['webVersion'];
      print(DBversion);

      if (DBversion != version) {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Update Found'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Please click update to get new version😊'),
                    // Text(''),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    html.window.location.reload();
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
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
     Future.delayed(const Duration(seconds: 5)).then((value) =>Navigator.pushReplacementNamed(context, 'sideBar_Page'));

   } else {

     // Navigate to login
     Future.delayed(const Duration(seconds: 5)).then((value) =>  Navigator.pushReplacementNamed(context, 'login_page'));

   }
      //  Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushNamedAndRemoveUntil(context, '/login_page',(route) => false,));
  }
  @override
  void initState() {
    getVersion();
    check();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.skyBlue,
        body: Center(
          child: Container(
            width: scrWidth*0.4,
            decoration: BoxDecoration(
              image:  DecorationImage(image: AssetImage("assets/images/Logo.png"))
            ),

          ),
        ),
      );

  }
}

