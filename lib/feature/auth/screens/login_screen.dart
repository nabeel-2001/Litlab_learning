import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/toastification.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
    ).hasMatch(value)) {
      return 'Password must be at least 8 characters long ';
    }
    return null;
  }
  bool eye=true;
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  loginUsers({required String email,required String password}) async {
    await ref.read(authControllerProvider).loginUser(
        context: context, email: email, password: password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F3FF), // light background color
      body: Stack(
        children: [
          // Background circular patterns
          Positioned(
            bottom: scrHeight*0.6,
            child: ClipPath(
              clipper: CustomContainerClipper(),
              child: Container(
                  height: scrHeight*0.5,
                  width: scrWidth*1,
                  color: ColorPalette.orange
              ),
            ),),
          Positioned(
            bottom: scrHeight*0.75,
            left: scrWidth*0.65,
            child: CircleAvatar(

              backgroundColor: ColorPalette.darkOrange,
              radius: scrWidth*0.3,
            ),
          ),

          // Main registration form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: scrWidth*0.7,
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
                            validator:_validateEmail,
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
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: _validatePassword,
                            obscureText: eye,
                            controller: password,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: () {
                                eye=!eye;
                                setState(() {

                                });
                              }, icon:eye?Icon(CupertinoIcons.eye_fill):Icon(CupertinoIcons.eye_slash_fill)),
                              labelText: 'password',
                              hintText: 'Please enter Password',
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
                                email.text.isEmpty?toastificationErrorWidget(context,"Please enter email"):password.text.isEmpty?
                                toastificationErrorWidget(context,"Please enter password"):loginUsers(email: email.text.trim(),password: password.text.trim());
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
                            label:  Text(
                              'Continue with Google',
                              style: TextStyle(color: Colors.black,
                                  fontSize: scrWidth*0.02),
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
                                  Navigator.pushNamedAndRemoveUntil(context,"registration", (route) => false,);
                                },
                                child: Text(
                                  "Register",

                                  style: TextStyle(

                                    fontSize: scrWidth*0.035,
                                    color: Color(0xFF87CEEB), // same as button color
                                    fontWeight: FontWeight.w700,
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
          ),
        ],
      ),
    );
  }
}
