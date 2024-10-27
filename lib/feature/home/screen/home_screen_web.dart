import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/materials/screen/material_page_web.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';

class HomeScreenWeb extends ConsumerStatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  ConsumerState<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends ConsumerState<HomeScreenWeb> {

  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    return Scaffold(
      body: Stack(
        children: [
          const CommonBackgroundWeb(i: 2,),
          Center(
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
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => const MaterialPageWeb(),));
                      } ,
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
