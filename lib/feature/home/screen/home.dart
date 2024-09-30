
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

import '../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.skyBlue,
      body: SizedBox(
        width: scrWidth*1.5,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: scrHeight*0.1,
            ),
            SizedBox(
              width: scrWidth*0.72,
              height: scrHeight*0.065,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Introduction to the World of",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: scrWidth*0.046
                    ),),
                  Center(child: Text("Literature",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: scrWidth*0.046
                    ),)),
                ],
              ),
            ),
SizedBox(
  height: scrHeight*0.02,
),
            Container(
              width: scrWidth*0.75,
              height: scrWidth*0.14,
              decoration: BoxDecoration(
                color: ColorPalette.yellow,
                borderRadius: BorderRadius.circular(scrWidth*0.035),
                border: Border.all(
                  color: ColorPalette.black,
                  width: scrWidth*0.001
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Search modules",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: scrWidth*0.025
                    ),),
                      prefixIcon: SvgPicture.asset("assets/images/search.svg",fit: BoxFit.none,),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      suffixIcon: SvgPicture.asset("assets/images/searchbook.svg",fit: BoxFit.none,)
                  ),

                ),
              ),
            ),
            SizedBox(
              width: scrWidth*0.85,
              height: scrHeight*0.67,
              // /   color: Colors.red,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return   Container(
                    width: scrWidth*0.85,
                    height: scrHeight*0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(scrWidth*0.02),
                        border: Border.all(
                            color: ColorPalette.black,
                            width: scrWidth*0.001
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: scrWidth*0.7,
                          height: scrHeight*0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: scrHeight*0.02,
                              ),
                             Text("Module 1: Love Across Time ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: scrWidth*0.035,
                                      fontWeight: FontWeight.w700
                                  ),),
                                 Text("22nd September 2024",
                                  style: GoogleFonts.inter(
                                      fontSize: scrWidth*0.018,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
SizedBox(
  height: scrHeight*0.02,
),
                              Container(
                                width: scrWidth*0.25,
                                height: scrHeight*0.05,
                                //color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: scrWidth*0.2,
                                      height: scrHeight*0.02,
                                      decoration: BoxDecoration(
                                          color: ColorPalette.yellow,
                                          borderRadius:BorderRadius.circular(scrWidth*0.01)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Read Summary",style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: scrWidth*0.018,
                                          ),),
                                          Icon(Icons.remove_red_eye_outlined,size: scrWidth*0.04,)
                                        ],
                                      ),
                                    ),
                                     SvgPicture.asset("assets/images/favorite.svg")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset("assets/images/module.svg")
                      ],
                    ),

                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: scrHeight*0.02,
                  );
                },
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
