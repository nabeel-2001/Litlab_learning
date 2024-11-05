import 'package:carousel_slider/carousel_slider.dart';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';
import 'package:litlab_learning/feature/department/screen/department_screen_web.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen_web.dart';


import 'package:lottie/lottie.dart';

class OnBodyScreenWeb extends StatefulWidget {
  const OnBodyScreenWeb({super.key});

  @override
  State<OnBodyScreenWeb> createState() => _OnBodyScreenWebState();
}

class _OnBodyScreenWebState extends State<OnBodyScreenWeb> {
  @override
  void initState() {
    super.initState();

    // Listen to browser back button event and prevent navigation
    html.window.history.pushState(null, '', html.window.location.href);
    html.window.onPopState.listen((event) {
      // Prevent back navigation by re-pushing the state
      html.window.history.pushState(null, '', html.window.location.href);
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false will prevent going back
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.only(left:scrWidth*0.05 ,top: scrWidth*0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: scrWidth*0.1,
                    child: Image.asset("assets/images/onbody_icon.png"),
                  ),
      
                  RichText(text: TextSpan(
                    text: '0% Failures in  ',
                    style:GoogleFonts.roboto(
                        height: scrHeight*0.0019,
                        letterSpacing: -1.2,
                        fontSize: scrWidth*0.03,
                        fontWeight: FontWeight.w900,
                        color: ColorPalette.skyBlue
                    ),
                    children: <TextSpan>[
                      TextSpan(text: ' Your Degree', style: GoogleFonts.roboto(
                          height: 1,
                          letterSpacing: -1,
                          fontSize: scrWidth*0.03,
                          fontWeight: FontWeight.w900,
                          color: ColorPalette.skyBlue
                      )),
                      TextSpan(text: ' Exams!', style: GoogleFonts.roboto(
                          height: scrHeight*0.0019,
                          letterSpacing: -1.2,
                          fontSize: scrWidth*0.03,
                          fontWeight: FontWeight.w900,
                          color: ColorPalette.darkBlue
                      )),
      
                    ],
                  ),),
      
                ],
              ),
            ),
        SizedBox(
          height: scrHeight*0.35,
          width: scrWidth*0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: scrWidth*0.1,
                height: scrHeight*0.3,
                decoration: BoxDecoration(
                    color:ColorPalette.white,
                    border: Border.all(color: ColorPalette.black,
                        width: scrWidth*0.001),
                    borderRadius: BorderRadius.circular(scrWidth*0.01)
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 15,
                      left: scrWidth*0.01),
                  child: Column(
      
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      RichText(text: TextSpan(
                        text: 'Engaging ',
                        style:GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            color: ColorPalette.skyBlue,
                            fontSize: scrWidth*0.01
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'and', style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                            color: ColorPalette.black,
      
                          )),
                        ],
                      ),),
                      Text("Interactive",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.skyBlue
                        ),),
                      Text("Learning",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.black
                        ),),
                      Text("Environment",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.skyBlue
                        ),),
                      SizedBox(
                        height: scrHeight*0.01,
                      )
                      ,
                      Center(
                        child: Transform.rotate(
                          alignment: const Alignment(0, 1),
                          angle: scrWidth*0.0004,
                          child: Container(
                              height: scrHeight*0.08,
                              width: scrWidth*0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(scrWidth*0.01),
                                  border: Border.all(
                                      color:Colors.yellow
                                  )
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(scrWidth*0.01),
                                  child: Lottie.asset("assets/animations/onboady2.json",fit: BoxFit.fill,))
      
      
                          ),
                        ),
                      )
                    ],
                  ),
                ),
      
              ),
              Container(
                width: scrWidth*0.1,
                height: scrHeight*0.3,
                decoration: BoxDecoration(
                    color:ColorPalette.white,
                    border: Border.all(color: ColorPalette.black,
                        width: scrWidth*0.001),
                    borderRadius: BorderRadius.circular(scrWidth*0.01)
      
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 15,
                      left: scrWidth*0.01),
                  child: Column(
      
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      RichText(text: TextSpan(
                        text: 'Comprehensive ',
                        style:GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            color: ColorPalette.skyBlue,
                            fontSize: scrWidth*0.01
                        ),
      
                      ),),
                      Text("and Well- ",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.black
                        ),),
                      Text("Structured ",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.skyBlue
                        ),),
                      Text("Study Materials",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.black
                        ),),
      
      
      
                      Transform.rotate(
                        alignment: const Alignment(0, 2),
                        angle: scrWidth*0.005,
                        child: SizedBox(
                            height: scrHeight*0.006,
                            width: scrWidth*0.08,
                            child: Lottie.asset("assets/animations/Animation1.json",fit: BoxFit.fitWidth,)
      
      
                        ),
                      )
                    ],
                  ),
                ),
      
              ),
              Container(
                width: scrWidth*0.1,
                height: scrHeight*0.3,
                decoration: BoxDecoration(
                    color:ColorPalette.white,
                    border: Border.all(color: ColorPalette.black,
                        width: scrWidth*0.001),
                    borderRadius: BorderRadius.circular(scrWidth*0.01)
      
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 15,
                      left: scrWidth*0.02),
                  child: Column(
      
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      Text("Enhanced ",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.skyBlue
                        ),),
                      Text("Learning ",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.skyBlue
                        ),),
                      Text("Outcomes",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth*0.01,
                            color: ColorPalette.black
                        ),),
      
                      SizedBox(
                        height: scrHeight*0.01,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: scrWidth*0.03,top: scrWidth*0.035),
      
                        child: SizedBox(
                            height: scrHeight*0.07,
                            width: scrWidth*0.08,
      
                            child: Lottie.asset("assets/animations/animation3.json",fit: BoxFit.fill,)
      
      
                        ),
                      )
                    ],
                  ),
                ),
      
              ),
            ],
          ),
        ),
      
            SizedBox(
              height: scrHeight*0.01,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // In department_screen (or any screen you want to refresh from):/ Pop until the first route
                  Navigator.pushNamedAndRemoveUntil(context, 'department_screen', (route) => false);
                },
                                                                                                                                                                                                                                        child: Container(
                  height: scrHeight*0.08,
                  width: scrWidth*0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        ColorPalette.skyBlue,
                        ColorPalette.white,
      
                      ],
                          end: const Alignment(1, 4)),
                      borderRadius: BorderRadius.circular(scrWidth*0.01)
                  ),
                  child:  Center(child: Text("Next",
                    style: GoogleFonts.montserrat(
                        fontSize:scrWidth*0.02 ,
                        fontWeight: FontWeight.bold
                    ),)),
                ),
              ),
            ),
            SizedBox(
              height: scrHeight*0.01,
            )
          ],
        ),
      ),
    );
  }
}
