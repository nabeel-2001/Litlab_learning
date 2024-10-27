import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/otp_verification.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: scrHeight*0.01,
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
                      hintText: "Enter your full name",
                      label: const Text("Name"),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(scrWidth*0.03)
                      )
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.02,
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
                        hintText: "Contact Number",
                        label: const Text("Phone"),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(scrWidth*0.03)
                        )
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.02,
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
                        hintText: "User@gmail.com",
                        label: const Text("Email"),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(scrWidth*0.03)
                        )
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.02,
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
                        hintText: "Select Your College",
                        label: const Text("College"),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(scrWidth*0.03)
                        )
                    ),
                  ),

                ],
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
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen(),));
              },
              child: Container(
                height: scrHeight*0.055,
                width: scrWidth*0.67,
                decoration: BoxDecoration(
                    color: ColorPalette.skyBlue,
                    borderRadius: BorderRadius.circular(scrWidth*0.03)
                ),
                child:  Center(child: Text("Register",
                  style: GoogleFonts.poppins(
                      color: ColorPalette.black,
                      fontWeight: FontWeight.bold
                  ),)),
              ),
            ),
            SizedBox(
              height:scrHeight*0.01 ,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have an account ? ",
                  style: GoogleFonts.poppins(
                      fontSize: scrWidth*0.03,
                      color: ColorPalette.black
                  ),),
                Text("Login",
                  style: GoogleFonts.poppins(
                      color: ColorPalette.skyBlue,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
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