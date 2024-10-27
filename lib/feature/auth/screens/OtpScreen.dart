import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/otp_verification.dart';

class MobileNumberVerificationScreen extends StatelessWidget {
  const MobileNumberVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          //  Image.asset("assets/images/authBackground.png"),
            // Circle background
                SizedBox(
                width: scrWidth*1,
                height: scrHeight*0.4,

                child: Stack(
                  children: [
                  Positioned(


                    child: ClipPath(
                      clipper: CustomContainerClipper(),
                      child: Container(
                        height: scrHeight*2,
                        width: scrWidth*1,
                        color: ColorPalette.orange
                      ),
                    ),),
                    Positioned(
                      bottom: scrHeight*0.097,
                      left: scrWidth*0.65,
                      child: CircleAvatar(

                        backgroundColor: ColorPalette.darkOrange,
                        radius: scrWidth*0.55,
                      ),
                    ),
                  ],
                ),
                ),

            const SizedBox(height: 20),
            const Text(
              'Enter Your Mobile Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 20),
            // const Text(
            //   'Enter Your Mobile Number',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
             SizedBox(height: scrHeight*0.05),
            const Text(
              'We will send you a confirmation code',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
             SizedBox(height: scrHeight*0.05),
            Padding(
              padding:  EdgeInsets.all(scrWidth * 0.03),
              child: IntlPhoneField(
                pickerDialogStyle: PickerDialogStyle(
                  backgroundColor: Colors.white,
                  countryCodeStyle: GoogleFonts.montserrat(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600
                  ),
                  countryNameStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  listTileDivider: const SizedBox(),
                  searchFieldInputDecoration:InputDecoration(
                    labelText: 'Search country',
                    suffixIcon: const Icon(CupertinoIcons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),  // Rounded corners
                      borderSide: BorderSide(
                        color: ColorPalette.primary.withOpacity(0.5),  // / Border color
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: ColorPalette.primary.withOpacity(0.5),  // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,  // Border color when not focused
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onSubmitted: (p0) {

                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),  // Rounded corners
                    borderSide: BorderSide(
                      color: ColorPalette.primary.withOpacity(0.5),  // / Border color
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorPalette.primary.withOpacity(0.5),  // Border color when focused
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,  // Border color when not focused
                      width: 1.0,
                    ),
                  ),
                ),
                flagsButtonPadding: const EdgeInsets.all(10),


                dropdownTextStyle: GoogleFonts.montserrat(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  try {
                    bool val = phone.isValidNumber();



                  }catch(e){


                  }

                },
                dropdownIconPosition: IconPosition.trailing,
              ),
            ),
            SizedBox(height: scrHeight*0.017),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen(),));
              },
              child: Container(
                height: scrHeight*0.055,
                width: scrWidth*0.67,
                decoration: BoxDecoration(
                    color: ColorPalette.authButtonColor,
                    borderRadius: BorderRadius.circular(scrWidth*0.03)
                ),
                child:  Center(child: Text("Verify",
                style: TextStyle(
                    color: ColorPalette.white,
                  fontWeight: FontWeight.bold
                ),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CustomShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Main container with a custom clipper
        ClipPath(
          clipper: CustomContainerClipper(),
          child: Container(
            height: 250,
            width: 250,
            color: Colors.grey[200],
          ),
        ),
        // Positioned circle at the top-right
        Positioned(
          top: 30,
          right: 30,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

// Custom clipper for the rounded container shape
class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Top rounded corners
    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    // Right edge and bottom semi-circle
    path.lineTo(size.width, size.height - 100);
    path.quadraticBezierTo(size.width / 2, size.height + 50, 0, size.height - 100);

    // Close path on the left edge
    path.lineTo(0, 20);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}