import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onboarding_screen3.dart';
import 'package:litlab_learning/core/common/common_button.dart';
class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  bool select=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Stack(
          children: [
            const CommonBackground(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scrHeight*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("It’s time to pick\nyour Stream",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),
                        InkWell(
                          onTap: () {
                            select=!select;

                            setState(() {

                            });
                          },
                          child: Container(
                            width: scrWidth*0.7,
                            height: scrHeight*0.085,
                            color: select==false?ColorPalette.white:ColorPalette.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Bachelor of Arts",
                                  style: GoogleFonts.montserrat(
                                      fontWeight:FontWeight.w600,
                                      fontSize: scrWidth*0.05,
                                      color: select==false?ColorPalette.black:ColorPalette.white

                                  ),),
                                SizedBox(width: scrWidth*0.03,),
                                SvgPicture.asset("assets/images/arts.svg")
                              ],
                            ),

                          ),
                        ),
                        Container(
                          width: scrWidth*0.85,
                          height: scrHeight*0.085,
                          color: ColorPalette.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Commerce & Management ",
                                style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.05
                                ),),
                              SizedBox(width: scrWidth*0.03,),
                              SvgPicture.asset("assets/images/commerce.svg")
                            ],
                          ),

                        ),
                        Container(
                          width: scrWidth*0.75,
                          height: scrHeight*0.085,
                          color: ColorPalette.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bachelor of Science",
                                style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.05
                                ),),
                              SizedBox(width: scrWidth*0.03,),
                              SvgPicture.asset("assets/images/science.svg")
                            ],
                          ),

                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: scrHeight*0.19,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen3(),));
                    },
                    child:CommonButtons(),
                  )
                ],),
            )
          ],
        )
    );
  }
}
