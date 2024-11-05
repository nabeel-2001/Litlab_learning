import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/common/widgets/common_snack_bar.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery_web.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/feature/materials/screen/material_view_pdf.dart';

import 'package:litlab_learning/model/users_model.dart';

class MaterialPageWeb extends ConsumerStatefulWidget {
  const MaterialPageWeb({super.key,});

  @override
  ConsumerState<MaterialPageWeb> createState() => _MaterialPageWebState();
}
class _MaterialPageWebState extends ConsumerState<MaterialPageWeb> {
  addFavorite(String materialId,UserModel userModel) async {
   await ref.read(materialControllerProvider).addFavorite(materialId, userModel);
  }
  removeFavorite(String materialId,UserModel userModel) async {
    await ref.read(materialControllerProvider).remove(materialId, userModel);
  }
  // getCourseDetails(String courseId) async {
  //   await ref.read(materialControllerProvider.notifier).getMaterial(courseId);
  // }
  // getUserFromHive() async {
  //   // var box = await Hive.openBox('userBox');
  //   // UserModel? userModel=await  box.get('currentUser') as UserModel?;
  //   // ref.read(userProvider.notifier).update((state) => userModel,);
  //   print(userModel!.id);
  //   print("${userModel!.course}iiiiii");
  // }
  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    return Scaffold(
      backgroundColor: ColorPalette.skyBlue,
      body: Stack(
       children: [
         const CommonBackgroundWeb(i: 2,),
        user==null?const Center(child: CircularProgressIndicator(),): Center(
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
                     height: scrWidth*0.035,
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
                         cursorHeight: scrWidth*0.02,
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
                  ref.watch(currentUser(user.id)).when(data: (data) {
                    return ref.watch(materialProvider(user!.course)).when(data: (data) {
                      return SizedBox(
                        width: scrWidth*1,
                        height: scrHeight*0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return   InkWell(
                              onTap: () {
                                ref.read(selectMaterial.notifier).state=data[index];

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
                                child: Container(
                                  width: scrWidth*0.18,
                                  height: scrWidth*0.06,
                                  decoration: BoxDecoration(
                                      color:ref.watch(selectMaterial)==data[index]? ColorPalette.black:ColorPalette.white,
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
                                            Text(data[index].title,
                                              style: GoogleFonts.montserrat(
                                                  color: ref.watch(selectMaterial)==data[index]?ColorPalette.white:ColorPalette.black,
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
                                                      Text('${DateFormat("dd-MM-yyyy").format(data[index].createTime)}',
                                                        style: GoogleFonts.inter(
                                                          color: ref.watch(selectMaterial)==data[index]?ColorPalette.white:ColorPalette.black,
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
                                                            InkWell(
                                                              onTap: () async {
                                                               await ref.read(materialControllerProvider).addMaterialsUser(material: data[index]);
                                                                ref.read(selectedPageIndexProvider.notifier).state = 4;
                                                              },
                                                              child: Container(
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
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  if(user.favourite.contains(data[index].id)){
                                                                    removeFavorite(data[index].id,user);
                                                                    setState(() {

                                                                    });
                                                                  }else {
                                                                    addFavorite(
                                                                        data[index]
                                                                            .id,
                                                                        user!);
                                                                  }
                                                                },
                                                                child: user.favourite.contains(data[index].id)?SvgPicture.asset("assets/images/select_favorite.svg",
                                                                  width: scrWidth * 0.01,
                                                                ):SvgPicture.asset("assets/images/favorite.svg"))
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

                          itemCount:   data.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      );
                    }, error: (error, stackTrace) {
                      print("${error.toString()}lllllllllllll");
                      return Text(error.toString());
                    }, loading: () {
                      return Center(child: CircularProgressIndicator(),);
                    },);
                  }, error: (error, stackTrace) {
                    print(error.toString());
                    return Text("${error.toString()}vvvvvvvvvv");
                  }, loading: () {
                    return const CircularProgressIndicator();
                  },),


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
                                             InkWell(
                                               onTap: () {

                                               },
                                                 child: SvgPicture.asset("assets/images/favorite.svg"))
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
                       if(ref.read(selectMaterial)!=null) {
                         // Navigator.pushNamed(context, "sideBar_Page/material_pdf_view",
                         // arguments: {
                         // 'pdf': ref.read(selectMaterial)!.fileUrl,
                         //
                         // });
                         Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialPdfView(pdfUrl: ref.read(selectMaterial)!.fileUrl,),));

                       }else{
                         showSnackBar(
                           message: "Please select Note",
                           context: context,
                           icon: null,
                           color: ColorPalette.black,
                         );
                       }
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
class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,

  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool select=true;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        // On tap action
      },
      child: Container(
        width: scrWidth*0.38,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Module 1: Love Across Time",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                fontSize: scrWidth * 0.008,
              ),
            ),
            // const Spacer(),
            Text(
              "22nd September 2024",
              style: GoogleFonts.inter(
                fontSize: scrWidth * 0.007,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: scrHeight*0.02,
            ),
            //const Spacer(),
            Row(

              children: [
                Container(
                  height: scrHeight*0.035,
                  width: scrWidth*0.064,

                  decoration: BoxDecoration(
                    color: ColorPalette.yellow, // Yellow background
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Read Summary",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: scrWidth * 0.0057,
                          ),
                        ),
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: scrWidth * 0.008,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: scrWidth*0.01,),
                InkWell(
                  onTap: () {
                    select=!select;
                    if (kDebugMode) {
                      print(select);
                    }
                    setState(() {

                    });
                  }
                  ,
                  child: select==true? SvgPicture.asset(
                    "assets/images/favorite.svg",
                    width: scrWidth * 0.01,
                  ):
                  SvgPicture.asset("assets/images/select_favorite.svg",
                    width: scrWidth * 0.01,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
