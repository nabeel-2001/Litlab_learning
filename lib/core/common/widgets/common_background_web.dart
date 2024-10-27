import 'package:flutter/material.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class CommonBackgroundWeb extends StatelessWidget {
  final int i;
  const CommonBackgroundWeb({super.key, required this.i, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background
            Container(
              color: ColorPalette.skyBlue, // The background color
              width: double.infinity,
              height: double.infinity,
            ),
            // Large Circle
            Positioned(
              bottom: -scrWidth*0.13,
              right: -scrWidth*0.009,
              child: CircleAvatar(
                backgroundColor: ColorPalette.lateWhite,
                radius: scrWidth*0.134,
              )
            ),
            // Medium Circle
            Positioned(
                bottom: -scrWidth*0.01,
              right:-scrWidth*0.07 ,
              child: CircleAvatar(
                radius: scrWidth*0.1,
                backgroundColor:ColorPalette.lateWhite
              ),
            ),
           i==0? Positioned(
               bottom: scrWidth*0.06,
               left:scrWidth*0.5,
               child: Container(
                 height: scrHeight*0.6,
                 width: scrWidth*0.6,
                 decoration: const BoxDecoration(
                     image: DecorationImage(image: AssetImage(AssetConst.backgroundCommonAuth))
                 ),
               )
           ):i==1?Positioned(
               bottom: scrWidth*0.001,
               right:scrWidth*0.001 ,
               child: Container(
                 height: scrHeight*0.5,
                 width: scrWidth*0.5,
                 decoration: const BoxDecoration(
                     image: DecorationImage(image: AssetImage(AssetConst.backgroundCommon))
                 ),
               )
           ):const SizedBox(),
          ],
        ),
      ),
    );

  }
}
