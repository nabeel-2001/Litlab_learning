import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/courses/controller/course_controller.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';
import 'package:litlab_learning/model/users_model.dart';


class CourseScreenWeb extends ConsumerStatefulWidget {

  const CourseScreenWeb( {super.key});

  @override
  ConsumerState<CourseScreenWeb> createState() => _CourseScreenWebState();
}

class _CourseScreenWebState extends ConsumerState<CourseScreenWeb> {
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
    super.initState();
    // Fetch courses when the widget is initialized

      getDepartmentId();

  }


  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(courseControllerProvider);
    final selectCourseId=ref.watch(selectCourse);
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackgroundWeb(i: 1,),
            Padding(
              padding: const EdgeInsets.only(left: 100.0,top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Now let’s select your \npapers!",
                    style: GoogleFonts.montserrat(
                        height: 1.2,
                        letterSpacing: 0.1,
                        color: ColorPalette.black,
                        fontSize: scrWidth*0.025,
                        fontWeight: FontWeight.w800
                    ),),
                  SizedBox(height: scrHeight*0.02,),
               courses.isNotEmpty? SizedBox(
                    height: scrHeight*0.6,
                    width: scrWidth*0.2,
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
                                        fontSize: scrWidth*0.015,
                                        color: isSelected?ColorPalette.white:ColorPalette.black

                                    ),),
                                  Container(
                                      height: scrHeight*0.054,
                                      width: scrWidth*0.025,
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

                  SizedBox(height: scrHeight*0.01,),
                  InkWell(
                    onTap: () {
                      if(selectCourseId==null){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select Your Course")));
                      }
                      else {
                        ref.read(courseControllerProvider.notifier).updateDepartment(courseId: selectCourseId);
                        Navigator.pushNamedAndRemoveUntil(context,'common_screen', (route) => false);

                      }

                    },
                    child:Container(
                      height: scrHeight*0.07,
                      width: scrWidth*0.12,
                      decoration: BoxDecoration(
                          color: ColorPalette.yellow,
                          borderRadius: BorderRadius.circular(scrWidth*0.01)
                      ),
                      child:  Center(child: Text("Next",
                        style: GoogleFonts.montserrat(
                            fontSize:scrWidth*0.01 ,
                            fontWeight: FontWeight.bold
                        ),)),
                    ),
                  )
                ],),
            ),
          ],
        )
    );
  }
}
