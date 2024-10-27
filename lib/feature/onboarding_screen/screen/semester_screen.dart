import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/common/common_button.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen.dart';
class SemesterScreen extends StatefulWidget {
  const SemesterScreen({super.key});

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
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
                  SizedBox(
                    height: scrHeight*0.25,
                    width: scrWidth*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("In which semester ",

                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("are you currently in? ",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),





                      ],
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.55,
                    width: scrWidth*1,
                    child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 2,
                      crossAxisSpacing: scrWidth*0.05,
                      mainAxisSpacing: scrWidth*0.05,

                    ),
                      itemCount: 6,
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
                            width: scrWidth*0.25,
                            height: scrHeight*0.085,
                            decoration: BoxDecoration(
                                color: select==index?ColorPalette.black:ColorPalette.white,
                                borderRadius: BorderRadius.circular(scrHeight*0.02),
                                border: Border.all(color: ColorPalette.black,
                                    width: scrWidth*0.001)

                            ),

                            child: Center(
                              child: Text("Semester $index",
                                style: GoogleFonts.roboto(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.05,
                                    color: select==index?ColorPalette.white:ColorPalette.black
                                ),),
                            ),

                          ),
                        );

                      },


                    ),
                  ),
                  //  SizedBox(height: scrHeight*0.19,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen(),));
                    },
                    child: const CommonButtons(),
                  )
                ],),
            ),
          ],
        )
    );
  }
}
