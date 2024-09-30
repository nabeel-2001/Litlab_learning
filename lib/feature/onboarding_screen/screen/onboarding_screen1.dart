import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onboarding_Screen2.dart';
import 'package:lottie/lottie.dart';

import '../../../core/contants/color_constants.dart';
import '../../../core/local/local_variables.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 12),
            child: Column(
              children: [
                SizedBox(
                  height: scrHeight*0.16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: scrWidth*0.1,

                        child: Image.asset("assets/images/Logo P 1.png"),
                      ),
                      SizedBox(
                        width: scrWidth*0.31,

                        child: Image.asset("assets/images/Group 481714.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: scrHeight*0.2,
                  width: scrWidth*0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("0% Failures in",
                        style: GoogleFonts.roboto(
                            height: scrHeight*0.0019,
                            letterSpacing: -1.2,
                            fontSize: scrWidth*0.098,
                            fontWeight: FontWeight.w900,
                            color: ColorPalette.skyBlue
                        ),),
                      Text("Your Degree ",
                        style: GoogleFonts.roboto(
                            letterSpacing: -1.2,
                            height: scrHeight*0.0019,
                            fontSize: scrWidth*0.098,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: ColorPalette.darkBlue
                        ),),
                      Text("Exams!",
                        style: GoogleFonts.roboto(

                            letterSpacing: -1.2,
                            fontSize: scrWidth*0.098,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: ColorPalette.skyBlue
                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          CarouselSlider(

            options: CarouselOptions(height:scrHeight*0.43,
           autoPlayAnimationDuration: Duration(seconds: 5),
            autoPlay: true),

            items: [1,2,3,].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return  Container(
                    width: scrWidth*0.7,
                    height: scrHeight*0.43,
                    decoration: BoxDecoration(
                        color:ColorPalette.white,
                        border: Border.all(color: ColorPalette.black,
                            width: scrWidth*0.005),
                        borderRadius: BorderRadius.circular(scrWidth*0.05)

                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(top: scrWidth*0.09,
                      left: scrWidth*0.06),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          RichText(text: TextSpan(
                            text: 'Engaging ',
                            style:GoogleFonts.roboto(
                              fontWeight: FontWeight.w900,
                              color: ColorPalette.skyBlue,
                              fontSize: scrWidth*0.07
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
                             fontSize: scrWidth*0.07,
                            color: ColorPalette.skyBlue
                          ),),
                          Text("Learning",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                             fontSize: scrWidth*0.07,
                            color: ColorPalette.black
                          ),),
                          Text("Environment",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                             fontSize: scrWidth*0.07,
                            color: ColorPalette.skyBlue
                          ),),
                          SizedBox(
                            height: scrHeight*0.02,
                          )
                          ,
                          Center(
                            child: Transform.rotate(
                              alignment: const Alignment(0, 1),
                              angle: scrWidth*3.0009,
                              child: Container(
                                  height: scrHeight*0.15,
                                  width: scrWidth*0.33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(scrWidth*0.05),
                                    border: Border.all(
                                      color:Colors.yellow
                                    )
                                  ),
                                  child: ClipRRect(
                                     borderRadius: BorderRadius.circular(scrWidth*0.05),
                                      child: Lottie.asset("assets/animations/onboady2.json",fit: BoxFit.fill,))


                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  );
                },
              );
            }).toList(),
          ),

          SizedBox(
            height: scrHeight*0.01,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen2(),));
            },
            child: Center(
              child: Container(
                height: scrHeight*0.055,
                width: scrWidth*0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorPalette.skyBlue,
                    ColorPalette.white,

                  ],
                  end: Alignment(1, 4)),
                  borderRadius: BorderRadius.circular(scrWidth*0.05)
                ),
                child:  Center(child: Text("Next",
                style: GoogleFonts.montserrat(
                  fontSize:scrWidth*0.05 ,
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
    );
  }
}
