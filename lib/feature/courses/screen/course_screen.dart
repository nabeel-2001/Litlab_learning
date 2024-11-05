import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/common/common_button.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';
import 'package:litlab_learning/feature/courses/controller/course_controller.dart';
import 'package:litlab_learning/model/users_model.dart';

class CourseScreen extends ConsumerStatefulWidget {
  const CourseScreen({super.key});

  @override
  ConsumerState<CourseScreen> createState() => _CourseScreenState();
}
class _CourseScreenState extends ConsumerState<CourseScreen> {
  int? select;
  List<Map<String,dynamic>> content=[
    {
      "text":"Common Papers",
      "image":AssetConst.commonPaper
    },
    {
      "text":"BA. Malayalam",
      "image":AssetConst.malayalam
    },
    {
      "text":"BA. History",
      "image":AssetConst.history
    },
    {
      "text":"BA. Sociology",
      "image":AssetConst.sociology
    },
    {
      "text":"BA. Economics",
      "image":AssetConst.economic
    },

  ];
  getDepartmentId() async {
    var box = await Hive.openBox('userBox');
    UserModel? a =await box.get('currentUser');
    print(a?.department??'');
    ref.read(courseControllerProvider.notifier).getCourse(a?.department??"");
  }
@override
  void initState() {
  getDepartmentId();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(courseControllerProvider);
    final selectCourseId=ref.watch(selectCourse);
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackground(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scrHeight*0.7,
                    width: scrWidth*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Now let’s select \n  your papers!",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: 0.1,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.045,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(
                          height: scrHeight*0.02,
                        ),
                        courses.isNotEmpty? SizedBox(
                          height: scrHeight*0.55,
                          width: scrWidth*0.55,
                          child: ListView.separated(
                            itemCount: courses.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              bool isSelected = selectCourseId == courses[index].id;

                              return  InkWell(
                                onTap: () {
                                  ref.read(selectCourse.notifier).state=isSelected?null:courses[index].id;

                                },
                                child: Container(
                                  width: scrWidth*0.09,
                                  height: scrHeight*0.09,
                                  color: isSelected?ColorPalette.black:ColorPalette.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(courses[index].courseTitle.toString(),
                                          style: GoogleFonts.montserrat(
                                              letterSpacing: -0.8,
                                              fontWeight:FontWeight.w600,
                                              fontSize: scrWidth*0.035,
                                              color: isSelected?ColorPalette.white:ColorPalette.black

                                          ),),
                                        Container(
                                            height: scrHeight*0.054,
                                            width: scrWidth*0.05,
                                            padding: EdgeInsets.all(scrWidth*0.004),
                                            decoration: BoxDecoration(
                                                color: ColorPalette.yellow,
                                                borderRadius: BorderRadius.circular(scrWidth*0.004)
                                            ),

                                            child: SvgPicture.asset(
                                              fit: BoxFit.contain,
                                              AssetConst.economic,

                                            )
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                              );

                            }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: scrHeight*0.023,
                            ) ;
                          },),
                        ):const CircularProgressIndicator(),


                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Malayalam",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/malayalam.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. History",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/history.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Sociology",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/sociolagy.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                        // Container(
                        //   width: scrWidth*0.8,
                        //   height: scrHeight*0.085,
                        //   color: ColorPalette.white,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text("BA. Economics",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight:FontWeight.w600,
                        //               fontSize: scrWidth*0.05
                        //           ),),
                        //         SizedBox(width: scrWidth*0.03,),
                        //         Container(
                        //             height: scrHeight*0.04,
                        //             width: scrWidth*0.1,
                        //             decoration: BoxDecoration(
                        //                 color: ColorPalette.yellow,
                        //                 borderRadius: BorderRadius.circular(scrWidth*0.01)
                        //             ),
                        //
                        //             child: Center(child: SvgPicture.asset("assets/images/economics.svg")))
                        //       ],
                        //     ),
                        //   ),
                        //
                        // ),
                      ],
                    ),
                  ),

                  SizedBox(height: scrHeight*0.02,),
                  InkWell(
                    onTap: () async {
                      if(selectCourseId==null){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select Your Course")));
                      }
                      else {
                        await ref.read(courseControllerProvider.notifier).updateDepartment(courseId: selectCourseId);
                        Navigator.pushNamedAndRemoveUntil(context,'common_screen', (route) => false);
                      }
                    },
                    child:const CommonButtons()
                  )
                ],),
            ),
          ],
        )
    );
  }
}
