import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/toastification.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/model/users_model.dart';

class Registration extends ConsumerStatefulWidget {
  const Registration({super.key});

  @override
  ConsumerState<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends ConsumerState<Registration> {
  String? imageUrl;

  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController college=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  setSearchParameters(String name) {
    List<String> caseSearchList = [];
    String temp = "";

    List<String> nameSplits = name.split(" ");
    for (int i = 0; i < nameSplits.length; i++) {
      String name = "";
      for (int k = i; k < nameSplits.length; k++) {
        name = i==nameSplits.length-1 ? name + nameSplits[k] : name + nameSplits[k] + " ";
      }
      temp = "";

      for (int j = 0; j < name.length; j++) {
        temp = temp + name[j];
        caseSearchList.add(temp.toUpperCase());
      }
    }
    return caseSearchList;
  }
  addUsers() async {
    UserModel? user= ref.watch(userProvider);
    UserModel? users=user?.copyWith(
        phone: phone.text,
        id: email.text,
        collegeName: college.text,
        search: setSearchParameters(name.text)
    )??UserModel(name: name.text, id: email.text, email: email.text, collegeName: college.text, department: "", course: "", commonCourse: "", phone: phone.text, image: "", search:[], favourite: [], delete: false, password: password.text);
    await ref.read(authControllerProvider).addUser(context: context,userModel: users!);
    name.clear();
    email.clear();
    college.clear();
    phone.clear();
    confirmPassword.clear();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    } else if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    } else if (value != password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateCollege(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select your college';
    }
    return null;
  }
  bool eye=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F3FF), // light background color
      body: Stack(
      children: [
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: scrWidth*0.7,
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: scrHeight*0.88,
                    width: scrWidth*0.25,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Input fields
                          TextFormField(
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            controller: name,
                            validator: (value) => _validateName(value),
                            decoration: InputDecoration(

                              labelText: 'Name',
                              hintText: 'Enter your full name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (value) => _validatePhone(value),
                            controller: phone,
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              hintText: 'Contact number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (value) => _validateEmail(value),
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'User@gmail.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            obscureText:eye ,
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            controller: password,
                            validator: (value) => _validatePassword(value),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: () {
                                eye=!eye;
                                setState(() {

                                });
                              }, icon:eye?Icon(CupertinoIcons.eye_fill):Icon(CupertinoIcons.eye_slash_fill)),
                              labelText: 'password',
                              hintText: 'enter password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            obscureText:eye ,
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            controller: confirmPassword,
                            validator: (value) => _validateConfirmPassword(value),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: () {
                                eye=!eye;
                                setState(() {

                                });
                              }, icon:eye?Icon(CupertinoIcons.eye_fill):Icon(CupertinoIcons.eye_slash_fill)),
                              labelText: 'Conform password',
                              hintText: 'enter Conform password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (value) => _validateCollege(value),
                            controller: college,
                            decoration: InputDecoration(
                              labelText: 'College',
                              hintText: 'Select your College',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),

                          // Register button
                          GestureDetector(
                            onTap: () {

                              // Action for Register button
                              if (_formKey.currentState!
                                  .validate()) {
                                name.text.isEmpty?toastificationErrorWidget(context,"Please enter name"):email.text.isEmpty?password.text.isEmpty?toastificationErrorWidget(context,"Please enter password"):
                                toastificationErrorWidget(context,"Please enter email"):phone.text.isEmpty?toastificationErrorWidget(context,"Please enter phone number"):
                                college.text.isEmpty?toastificationErrorWidget(context,"Please enter college"):addUsers();
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
                                    "Register",
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

                              // Google sign-in action
                              await ref.read(authControllerProvider).signInWithGoogle(context);
                              print(name);
                              UserModel? user= ref.watch(userProvider);
                              name.text = user!.name;
                              email.text = user!.email;


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
                                  Navigator.pushNamed(context,'login_page');
                                },
                                child: Text(
                                  "Login",

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
      ));
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