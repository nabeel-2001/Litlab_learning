import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class ProfileSettingsWeb extends StatefulWidget {
  const ProfileSettingsWeb({super.key});

  @override
  State<ProfileSettingsWeb> createState() => _ProfileSettingsWebState();
}

class _ProfileSettingsWebState extends State<ProfileSettingsWeb> {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen size and make the layout responsive


    return Scaffold(
      body: Stack(
        children: [
          CommonBackgroundWeb(i: 2,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0), // More horizontal padding for web
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile Settings",
                  style: GoogleFonts.montserrat(
                    fontSize: scrWidth * 0.025, // Adjust font size for larger screens
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: scrHeight * 0.05), // Less space than mobile for web layout

                Center(
                  child: Container(
                    height: scrHeight * 0.5, // Larger card for web
                    width: scrWidth * 0.25, // More space on the sides for web
                    decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(scrWidth * 0.015),
                      border: Border.all(
                        color: ColorPalette.black,
                        width: scrWidth * 0.001,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0), // More padding for larger content spacing
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: scrWidth * 0.03, // Larger avatar for web
                            backgroundImage: const AssetImage("assets/images/profile_image.png"),
                          ),
                          SizedBox(height: scrWidth * 0.02),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/profile_bottom.svg",
                                width: scrWidth * 0.01, // Adjust icon size
                              ),
                              SizedBox(width: scrWidth * 0.01),
                              Text(
                                "Vishnu.M",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth * 0.01, // Adjust font size
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: scrHeight * 0.01),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/phone.svg",
                                width: scrWidth * 0.01,
                              ),
                              SizedBox(width: scrWidth * 0.01),
                              Text(
                                "7902300929",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth * 0.01,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: scrHeight * 0.01),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/email.svg",
                                width: scrWidth * 0.01,
                              ),
                              SizedBox(width: scrWidth * 0.01),
                              Text(
                                "vishnum@gmail.com",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth * 0.01,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: scrHeight * 0.1), // More space at the bottom for web view
              ],
            ),
          ),
        ],
      )
    );
  }
}
