import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/download/download_loading_screen.dart';
import 'package:litlab_learning/feature/materials/screen/material_view_pdf.dart';
import 'package:litlab_learning/model/material_model.dart';
import 'package:litlab_learning/model/users_model.dart';
class ModuleSummery extends ConsumerStatefulWidget {
  const ModuleSummery({super.key});

  @override
  ConsumerState<ModuleSummery> createState() => _ModuleSummeryState();
}

class _ModuleSummeryState extends ConsumerState<ModuleSummery> {
  MaterialModel? material;
  UserModel? user;
  getMaterialDetails() async {
    var box = await Hive.openBox('userBox');
    final  material =await box.get('material');
    final user = await box.get('currentUser');
    ref.read(userProvider.notifier).state=user;
    ref.read(selectMaterial.notifier).state=material;

  }

  TextEditingController searchController = TextEditingController();
@override
  void initState() {
  getMaterialDetails();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    final material=ref.watch(selectMaterial);
    return Scaffold(
      backgroundColor: const Color(0xff6CCEE6),
      body: Stack(
        children: [
          CommonBackground(),
          Padding(
            padding: EdgeInsets.all(scrWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome to",
                          style: GoogleFonts.roboto(
                              fontSize: scrWidth*0.025,
                              fontWeight: FontWeight.w400
                          ),),
                        Text(
                          "LitLab",
                          style: GoogleFonts.roboto(fontSize: scrWidth * 0.08,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: user?.image??"https://static.vecteezy.com/system/resources/thumbnails/019/900/306/small/happy-young-cute-illustration-face-profile-png.png",
                          imageBuilder: (context, imageProvider) => Container(
                            width: scrWidth*0.3,
                            height: scrHeight*0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(

                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset("assets/images/profile.png",
                          width: scrWidth*0.08,
                          height: scrHeight*0.08,),
                        ),
                        Text(user?.name??"Alex John",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scrWidth*0.02
                          ),
                        )
                      ],
                    )
                  ],
                ),

                Container(
                  height: scrHeight * 0.135,
                  width: scrWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth * 0.04),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(scrWidth * 0.01),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  material?.title??"Topic: Love Across Time",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: scrWidth * 0.03),
                                ),
                                Text( material?.course??"No Data",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: scrWidth * 0.02),
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/images/book_4_line.svg")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: scrHeight * 0.5,
                  width: scrWidth * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth * 0.03),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.all(scrWidth*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: scrHeight * 0.06,
                            width: scrWidth * 0.2,
                            decoration: BoxDecoration(
                                color: ColorPalette.yellow,
                                borderRadius: BorderRadius.circular(scrWidth * 0.025)),
                            child: Center(
                              child: Text(
                                "Summary",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: scrWidth * 0.03),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scrHeight * 0.3,
                          width: scrWidth * 0.65,
                          child: Text(
                            material?.description?? "Love across time is a romantic narrative where themes of love, destiny, and the passage of time intertwine with the backdrop of Calicut University. In this chapter, the protagonists, who might have shared an intense love in the past, are brought together by fate in a modern-day university setting."
                            ,style: GoogleFonts.roboto(
                              fontSize: scrWidth*0.03
                          ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialPdfView(pdfUrl: ref.read(selectMaterial)!.fileUrl,),));
                          },
                          child: Container(
                            height: scrHeight*0.03,
                            width: scrWidth*0.31,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorPalette.black),
                                borderRadius: BorderRadius.circular(scrWidth*0.015)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Read the full version",
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w600,
                                      color: ColorPalette.lateBlack,
                                      fontSize: scrWidth*0.025
                                  ),),
                                SizedBox(width: scrWidth*0.01,),
                                SvgPicture.asset("assets/images/ice.svg",width: scrWidth*0.035,)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )

    );
  }
}