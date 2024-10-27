import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/download/download_loading_screen.dart';

class ModuleSummaryWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
        children: [
          CommonBackgroundWeb(i: 2,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scrWidth * 0.03,
                vertical: scrHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Header (stacking column on mobile, row on tablet/desktop)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
const SizedBox(),
                    Column(
                      children: [
                        CircleAvatar(
                            radius: scrWidth*0.02,
                            backgroundImage: const AssetImage("assets/images/profile_image.png"),),
                        Text(
                          "Alex John",
                          style: TextStyle(
                              color: ColorPalette.black, fontSize: scrWidth * 0.01),
                        )
                      ],
                    ),
                  ],
                ),
                // Topic Section
                Container(
                  height: scrHeight * 0.11,
                  width: scrWidth * 0.3  ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(scrWidth * 0.008),
                    color: ColorPalette.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: scrWidth * 0.015),
                            ),
                            Text(
                              "Time-Travel Romance",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: scrWidth * 0.008),
                            ),
                          ],
                        ),
                        SvgPicture.asset("assets/images/book_4_line.svg"),
                      ],
                    ),
                  ),
                ),
                // Summary Section
                Container(
                  height: scrHeight * 0.4,
                  width: scrWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth * 0.01),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: EdgeInsets.all(scrWidth * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: scrHeight * 0.05,
                          width: scrWidth * 0.08,
                          decoration: BoxDecoration(
                              color: ColorPalette.yellow,
                              borderRadius: BorderRadius.circular(scrWidth * 0.006)),
                          child: Center(
                            child: Text(
                              "Summary",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: scrWidth * 0.013),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scrHeight * 0.2,
                          width: scrWidth * 0.2,
                          child: Text(
                            "Love across time is a romantic narrative where themes of love, destiny, and the passage of time intertwine with the backdrop of Calicut University. In this chapter, the protagonists, who might have shared an intense love in the past, are brought together by fate in a modern-day university setting."
                            ,style: GoogleFonts.roboto(
                              fontSize: scrWidth * 0.011
                          ),
                          ),
                        ),
                        Container(
                          height: scrHeight * 0.04,
                          width: scrWidth * 0.12,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(scrWidth * 0.003)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Read the full version",
                                style: GoogleFonts.cabin(
                                    fontWeight: FontWeight.w600,
                                    fontSize: scrWidth * 0.01),
                              ),
                              SizedBox(width: scrWidth * 0.01),
                              SvgPicture.asset("assets/images/ice.svg",
                                  width: scrWidth * 0.013),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Go to Downloads Button

              ],
            ),
          ),
        ],
      )
    );
  }
}
