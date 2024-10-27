import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:lottie/lottie.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen(),)),);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.grey,
          body: Padding(
            padding: const EdgeInsets.only( top: 50),
            child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: scrHeight*0.1,
                      ),
            RichText(text: TextSpan(
              text: 'Loading your \n',
              style:GoogleFonts.roboto(

                height: 1.2,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.w900,
                  color: ColorPalette.white,
                  fontSize: scrWidth*0.12
              ),
              children: <TextSpan>[
                TextSpan(text: '  materials...', style: GoogleFonts.roboto(fontWeight: FontWeight.bold,
                  color: ColorPalette.yellow,
                  height: 1.2,
                  letterSpacing: -0.9,

                    fontSize: scrWidth*0.12
                )),
              ],
            ),),
                      SizedBox(
                        height: scrHeight*0.1,
                      ),
            Image.asset("assets/animations/loading.gif")
                  ],
                ),
          ),
    );
  }
}
