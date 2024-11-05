import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/model/users_model.dart';

class ProfileSettingsWeb extends ConsumerStatefulWidget {
  const ProfileSettingsWeb({super.key});

  @override
  ConsumerState<ProfileSettingsWeb> createState() => _ProfileSettingsWebState();
}

class _ProfileSettingsWebState extends ConsumerState<ProfileSettingsWeb> {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen size and make the layout responsive

final  userDetails=ref.watch(userProvider);
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
                    height: scrHeight * 0.45, // Larger card for web
                    width: scrWidth * 0.3, // More space on the sides for web
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
                          CachedNetworkImage(
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
                              radius: scrWidth*0.025,
                              backgroundImage: const AssetImage("assets/images/profile_image.png"),
                            ),
                          ),
                          SizedBox(height: scrWidth * 0.02),
                          Row(
                            children: [
                              SizedBox(
                                width: scrWidth*0.016,
                                child: SvgPicture.asset(
                                  "assets/images/profilesetting.svg",
                                  width: scrWidth * 0.015,
                                  // Adjust icon size
                                ),
                              ),
                              SizedBox(width: scrWidth * 0.01),
                              Text(
                                userDetails.name.toString(),
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
                                userDetails.phone.toString(),
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
                                userDetails.email.toString(),
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
