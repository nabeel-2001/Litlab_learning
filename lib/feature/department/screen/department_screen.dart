import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/department/controller/department_controller.dart';
import 'package:litlab_learning/core/common/common_button.dart';
class DepartmentScreen extends ConsumerStatefulWidget {
  const DepartmentScreen({super.key});

  @override
  ConsumerState<DepartmentScreen> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends ConsumerState<DepartmentScreen> {
  bool select=false;
  @override
  Widget build(BuildContext context) {

    final selectedStreamId = ref.watch(departmentId);
    return Scaffold(
        body:Stack(
          children: [
            const CommonBackground(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scrHeight*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("It’s time to pick\nyour Stream",
                          style: GoogleFonts.montserrat(
                              height: 1.2,
                              letterSpacing: -0.8,
                              color: ColorPalette.black,
                              fontSize: scrWidth*0.07,
                              fontWeight: FontWeight.bold
                          ),),
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
                                            children: [
                                              Text(stream.department,
                                                style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.w800,
                                                  fontSize: scrWidth*0.035,
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
                    )
                      ],
                    ),
                  ),

                  SizedBox(height: scrHeight*0.19,),
                  InkWell(
                    onTap: () {
                      if(selectedStreamId==null){
                        ref.read(departmentControllerProvider).updateDepartment(departmentName: selectedStreamId!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select Stream")));
                      }
                      else {
                        ref.read(departmentControllerProvider).updateDepartment(departmentName: selectedStreamId!);
                        Navigator.pushNamedAndRemoveUntil(context, 'course_screen', (route) => false);
                      }
                    },
                    child:const CommonButtons(),
                  )
                ],),
            )
          ],
        )
    );
  }
}
