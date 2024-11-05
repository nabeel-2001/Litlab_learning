import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';


class OnBodyScreen3Web extends StatefulWidget {
  const OnBodyScreen3Web({super.key});

  @override
  State<OnBodyScreen3Web> createState() => _OnBodyScreen3WebState();
}

class _OnBodyScreen3WebState extends State<OnBodyScreen3Web> {
  int? select;
  List<Map<String,dynamic>> content=[
    {
      "text":"Common Papers",
      "image":AssetConst.commonPaper
    },
    {
      "text":"BA. Malayalam",
      "image":AssetConst.malayalam
    },
    {
      "text":"BA. History",
      "image":AssetConst.history
    },
    {
      "text":"BA. Sociology",
      "image":AssetConst.sociology
    },
    {
      "text":"BA. Economics",
      "image":AssetConst.economic
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const CommonBackgroundWeb(i: 1,),
            Padding(
              padding: const EdgeInsets.only(left: 100.0,top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Now let’s select your \npapers!",
                    style: GoogleFonts.montserrat(
                        height: 1.2,
                        letterSpacing: 0.1,
                        color: ColorPalette.black,
                        fontSize: scrWidth*0.025,
                        fontWeight: FontWeight.w800
                    ),),
                  SizedBox(height: scrHeight*0.02,),
                  SizedBox(
                    height: scrHeight*0.6,
                    width: scrWidth*0.2,
                    child: ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                        return  InkWell(
                          onTap: () {
                            select=index;

                            setState(() {

                            });
                          },
                          child: Container(
                            width: scrWidth*0.08,
                            height: scrHeight*0.09,
                            color: select==index?ColorPalette.black:ColorPalette.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(content[index]["text"].toString(),
                                    style: GoogleFonts.montserrat(
                                        letterSpacing: -0.8,
                                        fontWeight:FontWeight.w600,
                                        fontSize: scrWidth*0.015,
                                        color: select==index?ColorPalette.white:ColorPalette.black

                                    ),),
                                  Container(
                                      height: scrHeight*0.054,
                                      width: scrWidth*0.025,
                                      padding: EdgeInsets.all(scrWidth*0.004),
                                      decoration: BoxDecoration(
                                          color: ColorPalette.yellow,
                                          borderRadius: BorderRadius.circular(scrWidth*0.004)
                                      ),

                                      child: SvgPicture.asset(
                                        fit: BoxFit.contain,
                                        content[index]["image"],

                                      )
                                  )
                                ],
                              ),
                            ),

                          ),
                        );

                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: scrHeight*0.023,
                      ) ;
                    },),
                  ),

                  SizedBox(height: scrHeight*0.01,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const CommonBackgroundWeb(i: 1),));
                    },
                    child:Container(
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
                    ),
                  )
                ],),
            ),
          ],
        )
    );
  }
}
