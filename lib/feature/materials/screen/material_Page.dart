
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:litlab_learning/core/common/widgets/common_snack_bar.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/materials/controller/material_controller.dart';
import 'package:litlab_learning/feature/materials/screen/material_view_pdf.dart';
import 'package:litlab_learning/model/users_model.dart';

import '../../../main.dart';

class MaterialScreen extends ConsumerStatefulWidget {
  const MaterialScreen({super.key});

  @override
  ConsumerState<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends ConsumerState<MaterialScreen> {
  addFavorite(String materialId,UserModel userModel) async {
    await ref.read(materialControllerProvider).addFavorite(materialId, userModel);
  }
  removeFavorite(String materialId,UserModel userModel) async {
    await ref.read(materialControllerProvider).remove(materialId, userModel);
  }
  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    return Scaffold(
      backgroundColor: ColorPalette.skyBlue,
      body: SizedBox(
         width: scrWidth*1,

        child: SingleChildScrollView(

          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: scrHeight*0.1,
              ),
              user==null?const Center(child: CircularProgressIndicator(),):  SizedBox(
                width: scrWidth*0.72,
                height: scrWidth*0.14,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Introduction to the World of",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800,
                          fontSize: scrWidth*0.046
                      ),),
                    Center(child: Text("Literature",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800,
                          fontSize: scrWidth*0.046
                      ),)),
                  ],
                ),
              ),
          SizedBox(
            height: scrHeight*0.02,
          ),
              Container(
                width: scrWidth*0.75,
                height: scrHeight*0.08,
                decoration: BoxDecoration(
                  color: ColorPalette.yellow,
                  borderRadius: BorderRadius.circular(scrWidth*0.035),
                  border: Border.all(
                    color: ColorPalette.black,
                    width: scrWidth*0.001
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Search modules",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: scrWidth*0.025
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
                height: scrHeight*0.02,
              ),
              ref.watch(currentUser(user!.id)).when(data: (data) {
    return ref.watch(materialProvider(user!.course)).when(data: (data) {
           return   SizedBox(
                width: scrWidth*0.85,
                // height: scrWidth*1.42,
                // /   color: Colors.red,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return   InkWell(
                      onTap: () {
                        ref.read(selectMaterial.notifier).state=data[index];

                      },
                      child: Container(
                        width: scrWidth*0.85,
                        height: scrHeight*0.2,
                        decoration: BoxDecoration(
                            color: ref.watch(selectMaterial)==data[index]?ColorPalette.black:ColorPalette.white,
                            borderRadius:BorderRadius.circular(scrWidth*0.02),
                            border: Border.all(
                                color: ColorPalette.black,
                                width: scrWidth*0.001
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: scrWidth*0.7,
                              height: scrHeight*0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: scrHeight*0.02,
                                  ),
                                 Text(data[index].title,
                                      style: GoogleFonts.montserrat(
                                          fontSize: scrWidth*0.035,
                                          fontWeight: FontWeight.w700
                                      ),),
                                     Text('${DateFormat("dd-MM-yyyy").format(data[index].createTime)}',
                                      style: GoogleFonts.inter(
                                          fontSize: scrWidth*0.018,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                      SizedBox(
                        height: scrHeight*0.02,
                      ),

                                    Container(
                                      width: scrWidth*0.3,
                                      height: scrHeight*0.05,
                                      //color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                          onTap: () async {
                                    await ref.read(materialControllerProvider).addMaterialsUser(material: data[index]);
                                    Navigator.pushNamed(context, "sideBar_Page/material_pageWeb/module_summery");
                                    ref.read(selectedPageIndexProvider.notifier).state = 4;
                                    },
                                       child:    Container(
                                            width: scrWidth*0.2,
                                            height: scrHeight*0.04,
                                            decoration: BoxDecoration(
                                                color: ColorPalette.yellow,
                                                borderRadius:BorderRadius.circular(scrWidth*0.01)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Read Summary",style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: scrWidth*0.018,
                                                ),),
                                                Icon(Icons.remove_red_eye_outlined,size: scrWidth*0.04,)
                                              ],
                                            ),
                                          ),
                                          ),
                                          SizedBox(
                                            width: scrWidth*0.01,

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
                                                width: scrWidth * 0.05,
                                              ):SvgPicture.asset("assets/images/favorite.svg",
                                                width: scrWidth * 0.05,
                                              ))
                                        ],
                                      ),
                                    ),

                                ],
                              ),
                            ),
                            SvgPicture.asset("assets/images/module.svg")
                          ],
                        ),

                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: scrHeight*0.02,
                    );
                  },
                  itemCount: data.length,
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
              SizedBox(
                height: scrHeight*0.01,
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
                  height: scrHeight*0.05,
                  width: scrWidth*0.2,
                  decoration: BoxDecoration(
                      color: ColorPalette.yellow,
                      borderRadius: BorderRadius.circular(scrWidth*0.005)
                  ),
                  child:  Center(child: Text("Next",
                    style: GoogleFonts.montserrat(
                        fontSize:scrWidth*0.03 ,
                        fontWeight: FontWeight.bold
                    ),)),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
