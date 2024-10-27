import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/select_Paper.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}
class _OnboardingScreen3State extends State<OnboardingScreen3> {
  int? select;
  List<Map<String,dynamic>> content=[
    {
      "text":"Common Papers",
      "image":AssetConst.commonPaper
    },
    {
      "text":"BA. Malayalam",
      "image":AssetConst.malayalam
    },
    {
      "text":"BA. History",
      "image":AssetConst.history
    },
    {
      "text":"BA. Sociology",
      "image":AssetConst.sociology
    },
    {
      "text":"BA. Economics",
      "image":AssetConst.economic
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackground(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scrHeight*0.65,
                    width: scrWidth*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Now let’s select \n  your papers!",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: 0.1,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),
                        ListView.separated(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {

                          return  InkWell(
                            onTap: () {
                              select=index;

                              setState(() {

                              });
                            },
                            child: Container(
                              width: scrWidth*0.8,
                              height: scrHeight*0.085,
                              color: select==index?ColorPalette.black:ColorPalette.white,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(content[index]["text"].toString(),
                                      style: GoogleFonts.montserrat(
                                          letterSpacing: -0.8,
                                          fontWeight:FontWeight.w600,
                                          fontSize: scrWidth*0.053,
                                          color: select==index?ColorPalette.white:ColorPalette.black

                                      ),),
                                    Container(
                                        height: scrHeight*0.17,
                                        width: scrWidth*0.08,
                                        padding: EdgeInsets.all(scrWidth*0.01),
                                        decoration: BoxDecoration(
                                            color: ColorPalette.yellow,
                                            borderRadius: BorderRadius.circular(scrWidth*0.01)
                                        ),

                                        child: SvgPicture.asset(
                                          fit: BoxFit.contain,
                                          content[index]["image"].toString(),
                                          height: scrHeight*0.05,
                                          width: scrWidth*0.03,))
                                  ],
                                ),
                              ),

                            ),
                          );

                        }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                               height: scrHeight*0.023,
                            ) ;
                        },),


                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Malayalam",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/malayalam.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. History",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/history.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Sociology",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/sociolagy.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Economics",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         SizedBox(width: scrWidth*0.03,),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/economics.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                      ],
                    ),
                  ),

                  SizedBox(height: scrHeight*0.19,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPaper(),));
                    },
                    child:Container(
                      height: scrHeight*0.06,
                      width: scrWidth*0.95,
                      decoration: BoxDecoration(
                          color: ColorPalette.yellow,
                          borderRadius: BorderRadius.circular(scrWidth*0.04)
                      ),
                      child:  Center(child: Text("Next",
                        style: GoogleFonts.montserrat(
                            fontSize:scrWidth*0.05 ,
                            fontWeight: FontWeight.bold
                        ),)),
                    ),
                  )
                ],),
            ),
          ],
        )
    );
  }
}
