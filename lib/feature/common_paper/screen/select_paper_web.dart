import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/common_paper/controller/common_paper_controller.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';
import 'package:litlab_learning/feature/semester/screen/semester_web_screen.dart';
class CommonPaperScreen extends ConsumerStatefulWidget {
  const CommonPaperScreen({super.key});
  @override
  ConsumerState<CommonPaperScreen> createState() => _SelectPaperWebState();
}
class _SelectPaperWebState extends ConsumerState<CommonPaperScreen> {
  updateProfile() async {
    await ref.read(commonPaperControllerProvider).
    updateProfile(userModel: ref.read(userProvider)!, department: ref.read(departmentId)!,
        course: ref.read(selectCourse)!, commonCourse: ref.read(commonPaper)!);
  }
  @override
  Widget build(BuildContext context) {
    String select=ref.watch(commonPaper)??'';
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackgroundWeb(i: 1,),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: SizedBox(
                width: scrWidth*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: scrHeight*0.1,

                      child: Text("Select your papers!",
                        style: GoogleFonts.montserrat(
                            height: 1.2,
                            letterSpacing: -0.8,
                            color: ColorPalette.black,
                            fontSize: scrWidth*0.03,
                            fontWeight: FontWeight.bold
                        ),),
                    ),

                   ref.watch(getCommonPapers).when(data: (data) {
                     return   SizedBox(
                       height: scrHeight*0.34,
                       child: ListView.separated(
                         itemCount: data.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: const BouncingScrollPhysics(),


                         itemBuilder: (context, index) {
                           return InkWell(
                             onTap: () {
                               ref.read(commonPaper.notifier).update((state) => data[index].id.toString(),);


                             },
                             child: Container(
                               height: scrHeight*0.1,
                               decoration: BoxDecoration(
                                   color: select==data[index].id?ColorPalette.black:ColorPalette.white,
                                   borderRadius: BorderRadius.circular(scrHeight*0.02)
                               ),

                               child: Padding(
                                 padding: const EdgeInsets.all(15.0),
                                 child: Text(data[index].id,
                                   style: GoogleFonts.montserrat(
                                       fontWeight:FontWeight.w600,
                                       fontSize: scrWidth*0.015,
                                       color: select==data[index].id?ColorPalette.white:ColorPalette.black
                                   ),),
                               ),

                             ),
                           );

                         },

                         separatorBuilder: (context, index) {
                           return SizedBox(
                             height: scrHeight*0.02,
                           );
                         },
                       ),
                     );
                   }, error: (error, stackTrace) {
                     return Text(error.toString());
                   }, loading: () {
                     return const CircularProgressIndicator();
                   },),
                    SizedBox(height: scrHeight*0.03,),
                    InkWell(
                      onTap: () {
                        if(select==null){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("pls Select Common Paper")));
                        }else{
                        context.go('/semester_screenWeb');
                         updateProfile();
                        }
                      },
                      child: Container(
                        height: scrHeight*0.07,
                        width: scrWidth*0.13,
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
            ),
          ],
        )
    );
  }
}
