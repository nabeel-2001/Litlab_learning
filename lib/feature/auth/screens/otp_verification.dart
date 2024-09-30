import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpController=TextEditingController();
    return Scaffold(
      backgroundColor: ColorPalette.lateBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: scrHeight*0.9,
            width: scrWidth*1,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(scrWidth*0.1),bottomRight: Radius.circular(scrWidth*0.1))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/authBackground.png"),
                // Circle background
            //         SizedBox(
            //         width: scrWidth*1,
            //         height: scrHeight*0.5,
            //
            //         child: Stack(
            //           children: [
            //           Positioned(
            //             bottom:scrHeight*0.1 ,
            // right: scrWidth*0.001,
            //             child: CircleAvatar(radius: scrWidth*0.7,
            //               backgroundColor: ColorPalette.orange,
            //             )
            //           ),
            //             // Circle background
            //             Positioned(
            //
            //               bottom: scrHeight*0.18,
            //               left: scrWidth*0.65,
            //               child: CircleAvatar(
            //
            //                 backgroundColor: ColorPalette.darkOrange,
            //                 radius: scrWidth*0.5,
            //               ),
            //             ),
            //           ],
            //         ),
            //         ),
                SizedBox(height: scrHeight*0.05),
                 Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: scrWidth*0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: scrHeight*0.03),
                // const SizedBox(height: 20),
                // const Text(
                //   'Enter Your Mobile Number',
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                 Text(
                  'We Will send you a one time password on',
                  style: TextStyle(
                    fontSize: scrWidth*0.04,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'this ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                  ],
                ),
                SizedBox(height: scrHeight*0.017),
                const Text(
                  '+91 - 12989200823',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: scrHeight*0.017),
                Pinput(
                  controller: _otpController,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: scrWidth * 0.12,
                    height: scrHeight * 0.06,
                    textStyle: TextStyle(
                      fontSize: scrWidth * 0.05,
                      color: ColorPalette.black, // Change the text color to purple
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth*0.2),
                      border: Border.all(
                          color: ColorPalette.blueAccent
                             ), // Purple border color
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: scrWidth * 0.12,
                    height: scrHeight * 0.06,
                    textStyle: TextStyle(
                      fontSize: scrWidth * 0.05,
                      color: ColorPalette.black, // Change the text color to purple
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth*0.2),
                      border: Border.all(
                          color: ColorPalette.orange
                      ), // Purple border color
                    ),
                  ),
                  separatorBuilder: (index) => SizedBox(width: scrWidth * 0.02),
                  validator: (value) {

                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: scrHeight*0.01),
                Text("00.30 "),
                SizedBox(height: scrHeight*0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not send OTP  ? ',
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: scrWidth*0.03,
                      ),
                    ),
                    Text(
                      'Send OTP',
                      style: TextStyle(
                        color: ColorPalette.orange,
                          fontSize: scrWidth*0.03,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ],
                ),
                SizedBox(height: scrHeight*0.023),
                Container(
                  height: scrHeight*0.05,
                  width: scrWidth*0.65,
                  decoration: BoxDecoration(
                      color: ColorPalette.authButtonColor,
                      borderRadius: BorderRadius.circular(scrWidth*0.03)
                  ),
                  child:  Center(child: Text("Submit",
                    style: TextStyle(
                      color: ColorPalette.white,
                        fontWeight: FontWeight.bold
                    ),)),
                )
              ],
            ),
          ),
          Container(
            height: scrHeight*0.1,
            width: scrWidth*1,
            decoration: BoxDecoration(
                color:ColorPalette.lateBlack
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have an account ? ",
                  style: GoogleFonts.poppins(
                    fontSize: scrWidth*0.03,
                      color: ColorPalette.white
                  ),),
                Text("Login",
                  style: GoogleFonts.poppins(
                      color: ColorPalette.white,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}