import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/side_bar.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';

class LoadingScreenWeb extends StatefulWidget {

  const LoadingScreenWeb({super.key,});

  @override
  State<LoadingScreenWeb> createState() => _LoadingScreenWebState();
}

class _LoadingScreenWebState extends State<LoadingScreenWeb> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5)).then((value) => context.go('sideBar_Page'),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: scrHeight*0.1,
          ),
          RichText(text: TextSpan(
            text: 'Loading your \n',
            style:GoogleFonts.roboto(

                height: 1.2,
                letterSpacing: -0.8,
                fontWeight: FontWeight.w900,
                color: ColorPalette.white,
                fontSize: scrWidth*0.04
            ),
            children: <TextSpan>[
              TextSpan(text: '  materials...', style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                  color: ColorPalette.yellow,
                  height: 1.2,
                  letterSpacing: -0.9,

                  fontSize: scrWidth*0.04
              )),
            ],
          ),),
          SizedBox(
            height: scrHeight*0.01,
          ),
          Image.asset("assets/animations/loading.gif",
             width: scrWidth*1,
          height: scrHeight*0.6,)
        ],
      ),
    );
  }
}
