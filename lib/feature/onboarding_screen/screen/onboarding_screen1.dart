import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:lottie/lottie.dart';
import '../../../core/local/local_variables.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  Widget buildRichText(List<TextSpan> textSpans) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.roboto(
          height: scrHeight * 0.0015,
          fontSize: scrWidth * 0.08,
          fontWeight: FontWeight.w800,

          color: ColorPalette.skyBlue,
        ),
        children: textSpans,
      ),
    );
  }

  Widget buildImageWithPadding(String imagePath, double width) {
    return SizedBox(
      width: width,
      child: Image.asset(imagePath),
    );
  }

  Widget buildCarouselItem({
    required String title1,
    required String title2,
    required String title3,
    required String lottieAsset,
  }) {
    return Container(
      width: scrWidth * 0.43,
      height: scrHeight * 0.33,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        border: Border.all(color: ColorPalette.black, width: scrWidth * 0.003),
        borderRadius: BorderRadius.circular(scrWidth * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 25, left: scrWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRichText([
              TextSpan(text: title1,
                style:  GoogleFonts.roboto(
              fontWeight: FontWeight.w900,
              fontSize: scrWidth * 0.038,
                  letterSpacing: 0.2,
              )),
              TextSpan(
                text: title2,
                style: GoogleFonts.roboto(color: ColorPalette.black,
                  fontWeight: FontWeight.w900,
                  fontSize: scrWidth * 0.038,
                  letterSpacing: 0.2,
                ),
              ),
            ]),
            Text(title3,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    fontSize: scrWidth * 0.038,
                    letterSpacing: 0.2,
                    color: ColorPalette.black)),
            SizedBox(height: scrHeight * 0.035),
            Transform.rotate(
              alignment: const Alignment(0, 1),
              angle: scrWidth*0.0004,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: scrHeight * 0.13,
                  width: scrWidth * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(scrWidth * 0.02),
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(scrWidth * 0.05),
                    child: Lottie.asset(lottieAsset, fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: scrWidth*1,
                  height: scrHeight * 0.16,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildImageWithPadding("assets/images/Logo P 1.png",
                            scrWidth * 0.1),
                        buildImageWithPadding(
                            "assets/images/Group 481714.png", scrWidth * 0.15),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: scrWidth*0.8,
                  child: buildRichText([
                    TextSpan(text: '0% Failures in  '),
                    TextSpan(text: '\nYour Degree'),
                    TextSpan(
                      text: '\nExams!',
                      style: GoogleFonts.roboto(color: ColorPalette.darkBlue),
                    ),
                  ]),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(

                height: scrHeight * 0.43,
                autoPlayAnimationDuration: const Duration(seconds: 5),
                autoPlay: true,
              ),
              items: [
              Container(
              width: scrWidth * 0.43,
              height: scrHeight * 0.33,
              decoration: BoxDecoration(
                color: ColorPalette.white,
                border: Border.all(color: ColorPalette.black, width: scrWidth * 0.003),
                borderRadius: BorderRadius.circular(scrWidth * 0.03),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 25, left: scrWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRichText([
                      TextSpan(text: "Engaging",
                          style:  GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          )),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.roboto(color: ColorPalette.black,
                          fontWeight: FontWeight.w900,
                          fontSize: scrWidth * 0.038,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ]),
                    Text("Interactive \n Learning \n Environment",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                            color: ColorPalette.black)),
                    SizedBox(height: scrHeight * 0.035),
                    Transform.rotate(
                      alignment: const Alignment(0, 1),
                      angle: scrWidth*0.0004,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: scrHeight * 0.13,
                          width: scrWidth * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(scrWidth * 0.02),
                            border: Border.all(color: Colors.yellow),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(scrWidth * 0.05),
                            child: Lottie.asset("assets/animations/onboady2.json", fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
                Container(
                  width: scrWidth * 0.43,
                  height: scrHeight * 0.33,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    border: Border.all(color: ColorPalette.black, width: scrWidth * 0.003),
                    borderRadius: BorderRadius.circular(scrWidth * 0.03),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, left: scrWidth * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(
                          text: 'Comprehensive ',
                          style: GoogleFonts.roboto(color: ColorPalette.skyBlue,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),

                        ),),
                        Text("and Well- ",
                          style: GoogleFonts.roboto(color: ColorPalette.black,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),
                        Text("Structured ",
                          style: GoogleFonts.roboto(color: ColorPalette.skyBlue,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),
                        Text("Study Materials",
                          style: GoogleFonts.roboto(color: ColorPalette.black,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),

                        Transform.rotate(
                          alignment: const Alignment(0, 1),
                          angle: scrWidth*0.0004,
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: scrHeight * 0.2,
                              width: scrWidth * 0.3,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(scrWidth * 0.05),
                                child: Lottie.asset("assets/animations/Animation1.json", fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: scrWidth * 0.43,
                  height: scrHeight * 0.33,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    border: Border.all(color: ColorPalette.black, width: scrWidth * 0.003),
                    borderRadius: BorderRadius.circular(scrWidth * 0.03),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, left: scrWidth * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Enhanced ",
                          style: GoogleFonts.roboto(color: ColorPalette.skyBlue,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),
                        Text("Learning ",
                          style: GoogleFonts.roboto(color: ColorPalette.black,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),
                        Text("Outcomes",
                          style: GoogleFonts.roboto(color: ColorPalette.black,
                            fontWeight: FontWeight.w900,
                            fontSize: scrWidth * 0.038,
                            letterSpacing: 0.2,
                          ),),
                        SizedBox(height: scrHeight * 0.05),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: scrHeight * 0.13,
                            width: scrWidth * 0.20,

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(scrWidth * 0.05),
                              child: Lottie.asset("assets/animations/animation3.json", fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: scrHeight * 0.01),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "department_screen"),
              child: Center(
                child: Container(
                  height: scrHeight * 0.06,
                  width: scrWidth * 0.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorPalette.skyBlue, ColorPalette.white],
                      end: const Alignment(1, 4),
                    ),
                    borderRadius: BorderRadius.circular(scrWidth * 0.03),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.montserrat(
                          fontSize: scrWidth * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: scrHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
