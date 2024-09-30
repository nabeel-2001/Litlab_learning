import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:lottie/lottie.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkOrange,
          body: Padding(
            padding: const EdgeInsets.only( top: 50),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
                    children: [

            RichText(text: TextSpan(
              text: 'Loading your \n',
              style:GoogleFonts.roboto(
                  fontWeight: FontWeight.w900,
                  color: ColorPalette.white,
                  fontSize: scrWidth*0.11
              ),
              children: <TextSpan>[
                TextSpan(text: 'materials...', style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                  color: ColorPalette.yellow,

                )),
              ],
            ),),
                      SizedBox(
                        height: scrHeight*0.2,
                      ),
            CircleAvatar(
              backgroundColor: ColorPalette.skyBlue,
              radius: scrWidth*0.48,
              child: Lottie.asset("assets/animations/1.json"),
            )
                  ],
                ),
          ),
    );
  }
}
