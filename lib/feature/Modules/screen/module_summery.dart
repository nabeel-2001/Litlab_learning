import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/download/download_loading_screen.dart';
class ModuleSummery extends StatefulWidget {
  const ModuleSummery({super.key});

  @override
  State<ModuleSummery> createState() => _ModuleSummeryState();
}

class _ModuleSummeryState extends State<ModuleSummery> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6CCEE6),
      body: Padding(
        padding: EdgeInsets.all(scrWidth * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Welcome to",
                    style: GoogleFonts.roboto(
                      fontSize: scrWidth*0.025,
                      fontWeight: FontWeight.w400
                    ),),
                    Text(
                      "LitLab",
                      style: GoogleFonts.roboto(fontSize: scrWidth * 0.08,
                      fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: scrHeight*0.065,
                        width: scrWidth*0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(scrWidth*0.028)
                        ),

                        child:Image.asset("assets/images/profile.png")
                    ),
                    Text("Alex John",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: scrWidth*0.02
                      ),
                    )
                  ],
                )
              ],
            ),
            
            Container(
              height: scrHeight * 0.125,
              width: scrWidth * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scrWidth * 0.04),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(scrWidth * 0.03),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Topic: Love Across Time",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: scrWidth * 0.043),
                            ),
                            Text("Time-Travel Romance ",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: scrWidth * 0.032),
                            ),
                          ],
                        ),
                        SvgPicture.asset("assets/images/book_4_line.svg")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: scrHeight * 0.3,
              width: scrWidth * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(scrWidth * 0.03),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding:  EdgeInsets.all(scrWidth*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: scrHeight * 0.045,
                        width: scrWidth * 0.4,
                        decoration: BoxDecoration(
                            color: ColorPalette.yellow,
                            borderRadius: BorderRadius.circular(scrWidth * 0.025)),
                        child: Center(
                          child: Text(
                            "Summary",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: scrWidth * 0.06),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scrHeight * 0.15,
                      width: scrWidth * 0.65,
                      child: Text(
                        "Love across time is a romantic narrative where themes of love, destiny, and the passage of time intertwine with the backdrop of Calicut University. In this chapter, the protagonists, who might have shared an intense love in the past, are brought together by fate in a modern-day university setting."
                        ,style: GoogleFonts.roboto(
                          fontSize: scrWidth*0.03
                      ),
                      ),
                    ),
                    Container(
                      height: scrHeight*0.025,
                      width: scrWidth*0.31,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.black),
                          borderRadius: BorderRadius.circular(scrWidth*0.015)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Read the full version",
                          style: GoogleFonts.cabin(
                            fontWeight: FontWeight.w600,
                            color: ColorPalette.lateBlack,
                            fontSize: scrWidth*0.025
                          ),),
                          SizedBox(width: scrWidth*0.01,),
                          SvgPicture.asset("assets/images/ice.svg",width: scrWidth*0.035,)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DownloadLoadingScreen(),));
              },
              child: Container(
                height: scrHeight * 0.075,
                width: scrWidth * 0.9,
                decoration: BoxDecoration(
                    color: ColorPalette.yellow,
                    borderRadius: BorderRadius.circular(scrWidth * 0.06)),
                child: Center(
                  child: Text(
                    "Go to Downloads",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: scrWidth * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}