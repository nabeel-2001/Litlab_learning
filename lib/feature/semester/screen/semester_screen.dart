import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/common/common_button.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen.dart';
class SemesterScreen extends ConsumerStatefulWidget {
  const SemesterScreen({super.key});

  @override
  ConsumerState<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends ConsumerState<SemesterScreen> {

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
  int select=-1;
  @override
  Widget build(BuildContext context) {
    final select=ref.watch(selectSemester);
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
                    height: scrHeight*0.25,
                    width: scrWidth*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("In which semester ",

                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("are you currently in? ",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),





                      ],
                    ),
                  ),
                  SizedBox(
                    height: scrHeight*0.55,
                    width: scrWidth*1,
                    child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: scrWidth*0.05,
                      mainAxisSpacing: scrWidth*0.05,

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
                            width: scrWidth*0.25,
                            height: scrHeight*0.085,
                            decoration: BoxDecoration(
                                color: select==index?ColorPalette.black:ColorPalette.white,
                                borderRadius: BorderRadius.circular(scrHeight*0.02),
                                border: Border.all(color: ColorPalette.black,
                                    width: scrWidth*0.001)

                            ),

                            child: Center(
                              child: Text("Semester $index",
                                style: GoogleFonts.roboto(
                                    fontWeight:FontWeight.w600,
                                    fontSize: scrWidth*0.045,
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
                          Navigator.pushNamedAndRemoveUntil(context,'loading_screenWeb', (route) => false);
                        }
                        else{
                          showAnimatedDialog(context);
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select Your Semester")));
                      }
                    },
                    child: const CommonButtons(),
                  )
                ],),
            ),
          ],
        )
    );
  }
}
