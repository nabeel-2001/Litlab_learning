import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';

class SelectPaper extends StatefulWidget {
  const SelectPaper({super.key});

  @override
  State<SelectPaper> createState() => _SelectPaperState();
}

class _SelectPaperState extends State<SelectPaper> {
  bool select=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: scrHeight*1.5,
          width: scrWidth*1.5,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.jpg",),fit: BoxFit.fill)

          ),
          child: Padding(
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
                      Text("Select your papers!",
                        style: GoogleFonts.montserrat(
                            color: ColorPalette.black,
                            fontSize: scrWidth*0.07,
                            fontWeight: FontWeight.bold
                        ),),
                      ListView.separated(
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),


                        itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            select=!select;

                            setState(() {

                            });
                          },
                          child: Container(
                            width: scrWidth*0.6,
                            height: scrHeight*0.12,
                            decoration: BoxDecoration(
                              color: select==false?ColorPalette.white:ColorPalette.black,
                              borderRadius: BorderRadius.circular(scrHeight*0.02)
                            ),
                            
                            child: Center(
                              child: Text("BA. English",
                                style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.05,
                                    color: select==false?ColorPalette.black:ColorPalette.white
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
                      )


                    ],
                  ),
                ),

                SizedBox(height: scrHeight*0.19,),
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
        )
    );
  }
}
