import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/feature/materials/screen/material_page_web.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';
import 'package:litlab_learning/model/users_model.dart';

class HomeScreenWeb extends ConsumerStatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  ConsumerState<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends ConsumerState<HomeScreenWeb> {
// getCourseDetails(String courseId) async {
//
//   await ref.read(materialControllerProvider.notifier).getMaterial(courseId);
// }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ref.read(userProvider);
    print(user?.course??"hiiiiiiii");
    if (user != null && user.course != null) {
      print("hiiiiiiiiiiiiiiiiii");
      // getCourseDetails(user.course); // Only call if user and course are not null
    }
    // This is called whenever the dependencies change
  }
  @override
  Widget build(BuildContext context) {
 final  user= ref.watch(userProvider);
    return Scaffold(
      body: Stack(
        children: [
          const CommonBackgroundWeb(i: 2,),
         user==null?const Center(child: CircularProgressIndicator()): Center(
            child: SizedBox(
              width: scrWidth*0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: scrWidth*0.3,
                    height: scrWidth*0.05,
                    // color: Colors.red,
                    child: Text(user!.course.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: scrWidth*0.02
                      ),),
                  ),
                 Row(

                   children: [
                     InkWell(
                       onTap: () {
                         // Navigate to the materials page by selecting index 3
                         ref.read(selectedPageIndexProvider.notifier).state = 3;  // Update the selected page index to Material Page
                       },
                       child: Container(
                         width: scrWidth*0.25,
                         height: scrHeight*0.2,
                         color: ColorPalette.yellow,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Core Paper",
                               style: GoogleFonts.montserrat(
                                   fontWeight: FontWeight.bold,
                                   fontSize: scrWidth*0.015
                               ),
                             ),
                             SizedBox(
                               width: scrWidth*0.01,
                             ),
                             SvgPicture.asset(AssetConst.coreIcon,
                             width: scrWidth*0.02,)
                           ],
                         ),
                       ),
                     ),
SizedBox(
  width: scrWidth*0.02,
),
                     Container(
                       width: scrWidth*0.25,
                       height: scrHeight*0.2,
                       color: ColorPalette.yellow,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Common Paper",
                             style: GoogleFonts.montserrat(
                                 fontWeight: FontWeight.bold,
                                 fontSize: scrWidth*0.015
                             ),

                           ),
                           SizedBox(
                             width: scrWidth*0.01,
                           ),
                           SvgPicture.asset(AssetConst.commonPaper)
                         ],
                       ),
                     )
                   ],
                 ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
