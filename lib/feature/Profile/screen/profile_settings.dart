import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: scrHeight*1,
        width: scrWidth*1,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.jpg",),fit: BoxFit.fill)

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile Settings",
              style: GoogleFonts.montserrat(

                fontSize: scrWidth*0.06,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(
                height: scrHeight*0.15,
              ),
              Center(
                child: Container(
                  height: scrHeight*0.35,
                  width:scrWidth*0.75 ,
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(scrWidth*0.03),
                    border: Border.all(color: ColorPalette.black,
                    width: scrWidth*0.002)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CircleAvatar(
                          radius: scrWidth*0.07,
                          backgroundImage: const AssetImage("assets/images/profile_image.png",),
                        ),
                        SizedBox(height: scrHeight*0.02,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.065,),
                            Text("Vishnu.M",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth*0.03
                              ),),
                          ],
                        ),
                        SizedBox(height: scrHeight*0.01,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/phone.svg",width: scrWidth*0.04,),
                            SizedBox(width: scrWidth*0.01,),
                            Text("7902300929",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth*0.03
                              ),),
                          ],
                        ),
                        SizedBox(height: scrHeight*0.01,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/email.svg",width: scrWidth*0.045,),
                            SizedBox(width: scrWidth*0.01,),
                            Text("vishnum@gmail.com",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: scrWidth*0.03
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: scrHeight*0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
