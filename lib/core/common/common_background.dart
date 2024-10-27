import 'package:flutter/material.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.skyBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: scrHeight*0.5,
                width: scrWidth*1,
              ),
              Positioned(
                right: scrWidth*0.25,
                top: scrHeight*0.08,
                child: CircleAvatar(
                  radius: scrWidth*0.5,
                  backgroundColor: ColorPalette.lateWhite,
                ),
              ),

              Positioned(
                left: scrWidth*0.15,
                top: scrHeight*0.1,
                child: CircleAvatar(
                  radius: scrWidth*0.5,
                  backgroundColor: ColorPalette.lateWhite,
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
