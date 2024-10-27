import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery_web.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/semester_screen.dart';

class MaterialPageWeb extends ConsumerStatefulWidget {
  const MaterialPageWeb({super.key,});

  @override
  ConsumerState<MaterialPageWeb> createState() => _MaterialPageWebState();
}

class _MaterialPageWebState extends ConsumerState<MaterialPageWeb> {
  @override
  Widget build(BuildContext context) {
    final material=ref.watch(materialControllerProvider);
    return Scaffold(
      backgroundColor: ColorPalette.skyBlue,
      body: Stack(
       children: [
         const CommonBackgroundWeb(i: 2,),
         Center(
           child: SizedBox(
             width: scrWidth*1,

             child: Padding(
               padding: const EdgeInsets.only(left: 20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SizedBox(
                     height: scrHeight*0.1,
                   ),
                   SizedBox(
                     width: scrWidth*0.4,
                     height: scrWidth*0.05,
                     // color: Colors.red,
                     child: Text("Introduction to the World of Literature",
                       style: GoogleFonts.montserrat(
                           fontWeight: FontWeight.w800,
                           fontSize: scrWidth*0.015
                       ),),
                   ),
                   Container(
                     width: scrWidth*0.4,
                     height: scrWidth*0.03,
                     decoration: BoxDecoration(
                         color: ColorPalette.yellow,
                         borderRadius: BorderRadius.circular(scrWidth*0.005),
                         border: Border.all(
                             color: ColorPalette.black,
                             width: scrWidth*0.0001
                         )
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(right: 8.0),
                       child: TextFormField(
                         decoration: InputDecoration(
                             label: Text("Search modules",
                               style: GoogleFonts.inter(
                                   fontWeight: FontWeight.w600,
                                   fontSize: scrWidth*0.01
                               ),),
                             prefixIcon: SvgPicture.asset("assets/images/search.svg",fit: BoxFit.none,),
                             border: UnderlineInputBorder(
                                 borderSide: BorderSide.none
                             ),
                             suffixIcon: SvgPicture.asset("assets/images/searchbook.svg",fit: BoxFit.none,)
                         ),

                       ),
                     ),
                   ),
                   SizedBox(
                     height: scrHeight*0.08,
                   ),
                  material==null?Text("No Data"): SizedBox(
                     width: scrWidth*1,
                     height: scrHeight*0.15,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context, index) {
                         return   InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>  ModuleSummaryWeb(),));
                           },
                           child: Padding(
                             padding: const EdgeInsets.only(left: 8.0,right: 8),
                             child: Container(
                               width: scrWidth*0.18,
                               height: scrWidth*0.06,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius:BorderRadius.circular(scrWidth*0.005),
                                   border: Border.all(
                                       color: ColorPalette.black,
                                       width: scrWidth*0.001
                                   )
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(

                                     width: scrWidth*0.15,
                                     height: scrHeight*0.18,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(
                                           height: scrHeight*0.01,
                                         ),
                                         Text(material[index].title,
                                           style: GoogleFonts.montserrat(
                                               fontSize: scrWidth*0.009,
                                               fontWeight: FontWeight.w700
                                           ),),
                                         SizedBox(
                                           height: scrHeight*0.08,
                                           width: scrWidth*0.15,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Column(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Text('${DateFormat("dd-MM-yyyy").format(material[index].createTime)}',
                                                     style: GoogleFonts.inter(
                                                         fontSize: scrWidth*0.005,
                                                         fontWeight: FontWeight.w500
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     width: scrWidth*0.09,
                                                     height: scrHeight*0.04,
                                                     //color: Colors.red,
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                       children: [
                                                         Container(
                                                           width: scrWidth*0.06,
                                                           height: scrHeight*0.09,
                                                           decoration: BoxDecoration(
                                                               color: ColorPalette.yellow,
                                                               borderRadius:BorderRadius.circular(scrWidth*0.005)
                                                           ),
                                                           child: Row(
                                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                             children: [
                                                               Text("Read Summary",style: GoogleFonts.inter(
                                                                 fontWeight: FontWeight.w700,
                                                                 fontSize: scrWidth*0.005,
                                                               ),),
                                                               Icon(Icons.remove_red_eye_outlined,size: scrWidth*0.01,)
                                                             ],
                                                           ),
                                                         ),
                                                         SvgPicture.asset("assets/images/favorite.svg")
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               SvgPicture.asset("assets/images/module.svg")
                                             ],
                                           ),
                                         ),


                                       ],
                                     ),
                                   ),

                                 ],
                               ),

                             ),
                           ),
                         );
                       },

                       itemCount:   material.length,
                       physics: const BouncingScrollPhysics(),
                       shrinkWrap: true,
                     ),
                   ),
                   SizedBox(height: scrHeight*0.03,),

                   Container(
                     width: scrWidth*0.24,
                     height: scrHeight*0.2,
                     decoration: BoxDecoration(
                         color: ColorPalette.modelQuestionColor,
                         borderRadius:BorderRadius.circular(scrWidth*0.01),
                         border: Border.all(
                             color: ColorPalette.black,
                             width: scrWidth*0.001
                         )
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(
                           width: scrWidth*0.2,
                           height: scrHeight*0.16,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Model question paper",
                                 style: GoogleFonts.montserrat(
                                   color: ColorPalette.white,
                                     fontSize: scrWidth*0.012,
                                     fontWeight: FontWeight.w700
                                 ),),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("22nd September 2024",
                                         style: GoogleFonts.inter(
                                             color: ColorPalette.white,
                                             fontSize: scrWidth*0.005,
                                             fontWeight: FontWeight.w500
                                         ),
                                       ),
                                       SizedBox(

                                         height: scrHeight*0.05,
                                       ),
                                       SizedBox(

                                         height: scrHeight*0.03,
                                         //color: Colors.red,
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [
                                             Container(
                                               width: scrWidth*0.06,
                                               height: scrHeight*0.06,
                                               decoration: BoxDecoration(
                                                   color: ColorPalette.yellow,
                                                   borderRadius:BorderRadius.circular(scrWidth*0.005)
                                               ),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                 children: [
                                                   Text("Read Summary",style: GoogleFonts.inter(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: scrWidth*0.004,
                                                   ),),
                                                   Icon(Icons.remove_red_eye_outlined,size: scrWidth*0.01,)
                                                 ],
                                               ),
                                             ),
                                             SizedBox(width: scrWidth*0.01,),
                                             SvgPicture.asset("assets/images/favorite.svg")
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                   Container(
                                       width: scrWidth*0.05,
                                       height: scrHeight*0.1,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(scrWidth*0.005),
                                         color: ColorPalette.yellow
                                       ),
                                       child: Center(child: SvgPicture.asset("assets/images/module.svg")))
                                 ],
                               ),


                             ],
                           ),
                         ),

                       ],
                     ),

                   ),
                   SizedBox(
                     height: scrHeight*0.02,
                   ),
                   InkWell(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const SemesterScreen(),));
                     },
                     child: Container(
                       height: scrHeight*0.07,
                       width: scrWidth*0.11,
                       decoration: BoxDecoration(
                           color: ColorPalette.yellow,
                           borderRadius: BorderRadius.circular(scrWidth*0.005)
                       ),
                       child:  Center(child: Text("Next",
                         style: GoogleFonts.montserrat(
                             fontSize:scrWidth*0.01 ,
                             fontWeight: FontWeight.bold
                         ),)),
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       ],
      ),

    );
  }
}
