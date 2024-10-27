import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/toastification.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/common_paper/screen/select_paper_web.dart';

class LoginPageWeb extends ConsumerStatefulWidget {
  const LoginPageWeb({super.key});

  @override
  ConsumerState<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends ConsumerState<LoginPageWeb> {

  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  loginUsers({required String email,required String password}) async {
await ref.read(authControllerProvider).loginUser(context: context, email: email, password: password);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F3FF), // light background color
      body: Stack(
        children: [
          // Background circular patterns
          Positioned(
            top: scrHeight * 0.7,
            right: scrWidth * 0.85,
            child: CircleAvatar(
              radius: scrWidth * 0.13,
              backgroundColor:ColorPalette.darkOrange, // bottom-left circle
            ),
          ),
          Positioned(
            top:scrHeight*0.84,
            right: scrWidth*0.75,
            child: CircleAvatar(
              radius: scrWidth * 0.1,
              backgroundColor: ColorPalette.orange, // bottom-right circle
            ),
          ),
          Positioned(
            top: scrHeight * 0.7,
            left: scrWidth * 0.85,
            child: CircleAvatar(
              radius: scrWidth * 0.13,
              backgroundColor:ColorPalette.darkOrange, // bottom-left circle
            ),
          ),
          Positioned(
            top:scrHeight*0.84,
            left: scrWidth*0.75,
            child: CircleAvatar(
              radius: scrWidth * 0.1,
              backgroundColor: ColorPalette.orange, // bottom-right circle
            ),
          ),

          // Main registration form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: scrHeight*0.8,
                    width: scrWidth*0.25,
                    child: Column(
                      children: [
                        // Input fields
                        TextFormField(
                          autovalidateMode: AutovalidateMode
                              .onUserInteraction,
                          controller: email,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.trim().length < 3) {
                              return "Must contain atleast 3 characters ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'email',
                            hintText: 'abc@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'password',
                            hintText: 'pls enter Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 32),

                        // Register button
                        GestureDetector(
                          onTap: () {

                            // Action for Register button
                            if (_formKey.currentState!
                                .validate()) {
                              email.text.isEmpty?toastificationErrorWidget(context,"pls enter email"):password.text.isEmpty?
                              toastificationErrorWidget(context,"pls enter password"):loginUsers(email: email.text.trim(),password: password.text.trim());
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(left: scrWidth*0.05,right: scrWidth*0.05),
                            child: Container(
                              height: scrHeight * 0.07,

                              decoration: BoxDecoration(
                                color: const Color(0xFF87CEEB), // button color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Social login buttons
                        ElevatedButton.icon(
                          onPressed: () async {
                            await ref.read(authControllerProvider).signInWithGoogle(context);
                            // Google sign-in action
                            // await ref.read(authControllerProvider).signInWithGoogle(ref);
                            // print(name);
                            // UserModel? user= ref.watch(userProvider);
                            // name.text = user!.name;
                            // email.text = user!.email;


                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: SvgPicture.asset('assets/images/google_icon.svg', height: 20),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Login redirect
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You have an account? "),
                            GestureDetector(
                              onTap: () {
                                context.go('/register_page');
                              },
                              child: Text(
                                "Register",

                                style: TextStyle(
                                  fontSize: scrWidth*0.013,
                                  color: Color(0xFF87CEEB), // same as button color
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
