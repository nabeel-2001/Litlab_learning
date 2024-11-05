import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';

class ProfileSettings extends ConsumerStatefulWidget {
  const ProfileSettings({super.key});

  @override
  ConsumerState<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends ConsumerState<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    final  userDetails=ref.watch(userProvider);
    return Scaffold(
      body:  Stack(
        children: [
          CommonBackground(),
          Padding(
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
                    height: scrHeight*0.45,
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
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: userDetails!.image.toString(),
                              imageBuilder: (context, imageProvider) => Container(
                                width: scrWidth*0.3,
                                height: scrHeight*0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(

                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => CircleAvatar(
                                radius: scrWidth*0.033,
                                backgroundImage: const AssetImage("assets/images/profile_image.png"),
                              ),
                            ),
                          ),

                          SizedBox(height: scrHeight*0.02,),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.045,),
                              SizedBox(width: scrWidth*0.02,),
                              Text(userDetails.name,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: scrWidth*0.03
                                ),),
                            ],
                          ),
                          SizedBox(height: scrHeight*0.01,),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/phone.svg",width: scrWidth*0.045,),
                              SizedBox(width: scrWidth*0.02,),
                              Text(userDetails.phone,
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
                              SizedBox(width: scrWidth*0.02,),
                              Text(userDetails.email,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: scrWidth*0.03
                                ),),
                            ],
                          ),
                          SizedBox(
                            height: scrHeight*0.03,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: () {
                                  ref.read(authControllerProvider).logout(context: context);
                                }, icon: const Icon(Icons.logout_outlined),

                                ),
                                Text("Logout",
                                style: TextStyle(
                                  fontSize: scrWidth*0.04,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          )
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
        ],

      ),

    );
  }
}
