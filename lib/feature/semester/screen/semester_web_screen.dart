import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen_web.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';

class SemesterWebScreen extends ConsumerStatefulWidget {
  const SemesterWebScreen({super.key,});

  @override
  ConsumerState<SemesterWebScreen> createState() => _SemesterWebScreenState();
}


class _SemesterWebScreenState extends ConsumerState<SemesterWebScreen> {

  void showAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Alert',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog(
          title: Text('This Semester Not Found'),
          content: Text('Comming Soon'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation1,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final select=ref.watch(selectSemester);
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackgroundWeb(i: 1,),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,
              top: 30 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scrHeight*0.25,
                    width: scrWidth*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("In which semester ",

                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.03,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("are you currently in? ",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.03,
                              fontWeight: FontWeight.bold
                          ),),





                      ],
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.5,
                    width: scrWidth*0.3,
                    child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: scrWidth*0.02,
                      mainAxisSpacing: scrWidth*0.02,

                    ),
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),


                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            ref.read(selectSemester.notifier).update((state) =>index ,);
                          },
                          child: Container(
                            width: scrWidth*0.04,
                            height: scrHeight*0.02,
                            decoration: BoxDecoration(
                                color: select==index?ColorPalette.black:ColorPalette.white,
                                borderRadius: BorderRadius.circular(scrHeight*0.02),
                                border: Border.all(color: ColorPalette.black,
                                    width: scrWidth*0.001)

                            ),

                            child: Center(
                              child: Text("Semester ${index + 1}",
                                style: GoogleFonts.roboto(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.01,
                                    color: select==index?ColorPalette.white:ColorPalette.black
                                ),),
                            ),

                          ),
                        );

                      },


                    ),
                  ),
                  //  SizedBox(height: scrHeight*0.19,),
                  InkWell(
                    onTap: () {
                      if(select != null) {
                        if (select == 0) {
                          context.go("/loading_screenWeb");
                        }
                        else{
                          showAnimatedDialog(context);
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("pls Select Your Semester")));
                      }
                    },
                    child:  Container(
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
                    )
                  )
                ],),
            ),
          ],
        )
    );
  }
}
