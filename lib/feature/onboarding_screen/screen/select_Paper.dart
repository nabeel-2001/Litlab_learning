import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';

class SelectPaper extends StatefulWidget {
  const SelectPaper({super.key});

  @override
  State<SelectPaper> createState() => _SelectPaperState();
}

class _SelectPaperState extends State<SelectPaper> {
  int select=-1;
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: scrHeight*0.2,
                        child: Center(
                          child: Text("Select your papers!",
                            style: GoogleFonts.montserrat(
                              height: 1.2,
                                letterSpacing: -0.8,
                                color: ColorPalette.black,
                                fontSize: scrWidth*0.07,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),

                      SizedBox(
                        height: scrHeight*0.51,
                        child: ListView.separated(
                          itemCount: 3,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),


                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                select=index;

                                setState(() {

                                });
                              },
                              child: Container(
                                width: scrWidth*0.4,
                                height: scrHeight*0.12,
                                decoration: BoxDecoration(
                                    color: select==index?ColorPalette.black:ColorPalette.white,
                                    borderRadius: BorderRadius.circular(scrHeight*0.02)
                                ),

                                child: Center(
                                  child: Text("BA. English",
                                    style: GoogleFonts.montserrat(
                                        fontWeight:FontWeight.w600,
                                        fontSize: scrWidth*0.05,
                                        color: select==index?ColorPalette.white:ColorPalette.black
                                    ),),
                                ),

                              ),
                            );

                          },

                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: scrHeight*0.05,
                            );
                          },
                        ),
                      )


                    ],
                  ),

                  SizedBox(height: scrHeight*0.135,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SemesterScreen(),));
                    },
                    child: Container(
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
