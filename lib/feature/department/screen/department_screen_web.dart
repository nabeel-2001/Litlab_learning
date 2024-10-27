import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/common/common_button.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';
import 'package:litlab_learning/feature/courses/screen/course_screen_web.dart';
import 'package:litlab_learning/feature/department/controller/department_controller.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/OnBody_Screen.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onboarding_screen3.dart';

import 'package:lottie/lottie.dart';

class DepartmentScreen extends ConsumerStatefulWidget {
  const DepartmentScreen({super.key});

  @override
  ConsumerState<DepartmentScreen> createState() => _OnBodyScreen1WebState();
}

class _OnBodyScreen1WebState extends ConsumerState<DepartmentScreen> {

bool select =false;
  @override
  Widget build(BuildContext context) {

    final selectedStreamId = ref.watch(departmentId);
    return Scaffold(
        body: Stack(
      children: [
        const CommonBackgroundWeb(i: 0,),
        Padding(
          padding: EdgeInsets.all(scrWidth * 0.05),
          child: SizedBox(
            width: scrWidth * 0.5,
            height: scrHeight * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: scrHeight * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "It’s time to pick your Stream",
                        style: GoogleFonts.montserrat(
                            height: 1.2,
                            letterSpacing: -0.8,
                            color: ColorPalette.black,
                            fontSize: scrWidth * 0.023,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: scrHeight*0.02,
                      ),
                      ref.watch(getDepartment).when(
                            data: (data) {
                              return Column(
                                children: List.generate(data.length ,
                                (index) {
                                  var stream = data[index];
                                  bool isSelected = selectedStreamId == stream.id;

                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(departmentId.notifier)
                                              .state = isSelected ? null : stream.id;
                                        },
                                        child:Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 250),
                                            // width:scrWidth*0.24,
                                            height: scrHeight*0.09,
                                            color: isSelected?ColorPalette.black:ColorPalette.white,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10,2,10,2),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(stream.department,
                                                    style: GoogleFonts.montserrat(
                                                      fontWeight:FontWeight.w800,
                                                      fontSize: scrWidth*0.012,
                                                      color: isSelected ? ColorPalette.white : ColorPalette.black,

                                                    ),),
                                                  SizedBox(width: scrWidth*0.01,),
                                                  SvgPicture.asset("assets/images/arts.svg")
                                                ],
                                              ),
                                            ),

                                          ),
                                        ),

                                      ),
                                    ],
                                  );

                                },),
                              );
                            },
                            error: (error, stackTrace) =>
                                Text('Error: ${error.toString()}'),
                            loading: () => const CircularProgressIndicator(),

                            // InkWell(
                            //   onTap: () {
                            //     select=!select;
                            //
                            //     setState(() {
                            //
                            //     });
                            //   },
                            //   child: Container(
                            //     width: scrWidth*0.2,
                            //     height: scrHeight*0.09,
                            //     color: select==false?ColorPalette.white:ColorPalette.black,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text("Bachelor of Arts",
                            //           style: GoogleFonts.montserrat(
                            //               fontWeight:FontWeight.w800,
                            //               fontSize: scrWidth*0.012,
                            //               color: select==false?ColorPalette.black:ColorPalette.white
                            //
                            //           ),),
                            //         SizedBox(width: scrWidth*0.01,),
                            //         SvgPicture.asset("assets/images/arts.svg")
                            //       ],
                            //     ),
                            //
                            //   ),
                            // ),
                            // Container(
                            //   width: scrWidth*0.24,
                            //   height: scrHeight*0.09,
                            //   color: ColorPalette.white,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("Commerce & Management ",
                            //         style: GoogleFonts.montserrat(
                            //             fontWeight:FontWeight.w800,
                            //             fontSize: scrWidth*0.012
                            //         ),),
                            //       SizedBox(width: scrWidth*0.01,),
                            //       SvgPicture.asset("assets/images/commerce.svg")
                            //     ],
                            //   ),
                            //
                            // ),
                            // Container(
                            //   width: scrWidth*0.24,
                            //   height: scrHeight*0.09,
                            //   color: ColorPalette.white,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("Bachelor of Science",
                            //         style: GoogleFonts.montserrat(
                            //             fontWeight:FontWeight.w800,
                            //             fontSize: scrWidth*0.012
                            //         ),),
                            //       SizedBox(width: scrWidth*0.01,),
                            //       SvgPicture.asset("assets/images/science.svg")
                            //     ],
                            //   ),
                            //
                            // ),
                          )
                    ],
                  ),
                ),
                SizedBox(
                  height: scrHeight*0.01,
                ),
                InkWell(
                  onTap: () {
                    if(selectedStreamId==null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pls select Stream")));
                    }
                    else {
                      context.go('/course_screen_web');
                    }
                  },
                  child: Container(
                    height: scrHeight * 0.07,
                    width: scrWidth * 0.12,
                    decoration: BoxDecoration(
                        color: ColorPalette.yellow,
                        borderRadius: BorderRadius.circular(scrWidth * 0.01)),
                    child: Center(
                        child: Text(
                      "Next",
                      style: GoogleFonts.montserrat(
                          fontSize: scrWidth * 0.01,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
