import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment. start,
                 children: [
                   Text("Welcome to your dashboard",
                   style: GoogleFonts.inter(
                     fontSize: scrWidth*0.035,
                     fontWeight: FontWeight.w400,

                   ),),
                   Text("Vishnu",
                     style: GoogleFonts.montserrat(
                         fontWeight: FontWeight.w600,
                         fontSize: scrWidth*0.055

                     ),),
                 ],
               ),


               SizedBox(
                 width: scrWidth*0.9,
                 height: scrWidth*0.35,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CircleAvatar(
                       radius: scrWidth*0.09,
                       backgroundImage: const AssetImage("assets/images/profile_image.png"),
                     ),
                     Text("Vishnu.M",
                     style: GoogleFonts.montserrat(
                       fontSize: scrWidth*0.05,
                       fontWeight: FontWeight.w700
                     ),),
                     Text("Bachelor of Arts",
                       style: GoogleFonts.manrope(
                           fontSize: scrWidth*0.03,
                           fontWeight: FontWeight.w500
                       ),),


                   ],
                 ),
               ),
               SizedBox(
                 height: scrHeight*0.5,

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           height: scrHeight*0.2,
                           width:scrWidth*0.42 ,
                           decoration: BoxDecoration(
                               color: ColorPalette.white,
                               borderRadius: BorderRadius.circular(scrWidth*0.03)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.08,),
                                 Text("Profile Settings",
                                   style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.w700,
                                       fontSize: scrWidth*0.033
                                   ),),
                                 Text("Manage your profile",
                                   style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.w400,
                                       fontSize: scrWidth*0.023
                                   ),),
                               ],
                             ),
                           ),
                         ),
                         Container(
                           height: scrHeight*0.2,
                           width:scrWidth*0.42 ,
                           decoration: BoxDecoration(
                               color: ColorPalette.white,
                               borderRadius: BorderRadius.circular(scrWidth*0.03)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.08,),
                                 Text("Profile Settings",
                                   style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.w700,
                                       fontSize: scrWidth*0.033
                                   ),),
                                 Text("Manage your profile",
                                   style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.w400,
                                       fontSize: scrWidth*0.023
                                   ),),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                     Container(
                       height: scrHeight*0.2,
                       width:scrWidth*0.42 ,
                       decoration: BoxDecoration(
                           color: ColorPalette.white,
                           borderRadius: BorderRadius.circular(scrWidth*0.03)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.08,),
                             Text("Profile Settings",
                               style: GoogleFonts.montserrat(
                                   fontWeight: FontWeight.w700,
                                   fontSize: scrWidth*0.033
                               ),),
                             Text("Manage your profile",
                               style: GoogleFonts.montserrat(
                                   fontWeight: FontWeight.w400,
                                   fontSize: scrWidth*0.023
                               ),),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 height: scrHeight*0.07,
               )
             ],
          ),
        ),
      ),
    );
  }
}
