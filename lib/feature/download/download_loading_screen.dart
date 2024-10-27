import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:lottie/lottie.dart';

class DownloadLoadingScreen extends StatefulWidget {
  const DownloadLoadingScreen({super.key});

  @override
  State<DownloadLoadingScreen> createState() => _DownloadLoadingScreenState();
}

class _DownloadLoadingScreenState extends State<DownloadLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.grey,
      body: Padding(
        padding: const EdgeInsets.only( top: 80,left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            RichText(text: TextSpan(
              text: 'Downloading  \nyour ',
              style:GoogleFonts.roboto(
                  fontWeight: FontWeight.w900,
                  color: ColorPalette.white,
                  fontSize: scrWidth*0.11
              ),
              children: <TextSpan>[
                TextSpan(text: 'notes...', style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                  color: ColorPalette.yellow,

                )),
              ],
            ),),
            SizedBox(
              height: scrHeight*0.2,
            ),
            Image.asset("assets/animations/Downloadloding.gif")
          ],
        ),
      ),
    );
  }
}
