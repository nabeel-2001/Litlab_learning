import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';

class DownloadingScreen extends StatefulWidget {
  const DownloadingScreen({super.key});

  @override
  State<DownloadingScreen> createState() => _DownloadingScreenState();
}

class _DownloadingScreenState extends State<DownloadingScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CommonBackground(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: scrHeight*0.08,
                  width: scrWidth*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Downloads",
                          style: GoogleFonts.montserrat(

                              fontSize: scrWidth*0.06,
                              fontWeight: FontWeight.w700
                          ),),
                      ),
                      CircleAvatar(
                        radius: scrWidth*0.04,
                        backgroundImage: const AssetImage("assets/images/profile_image.png",),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: scrHeight*0.065,
                  width: scrWidth*0.8,
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(

                      prefixIcon:SvgPicture.asset("assets/images/search.svg",width: scrWidth*0.03,height: scrHeight*0.03,fit: BoxFit.none,),
                      hintText: "Search notes, materials & more",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:ColorPalette.black),
                          borderRadius: BorderRadius.circular(scrWidth * 0.03)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(scrWidth * 0.03),
                        borderSide: BorderSide(color:ColorPalette.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: scrWidth*0.85,
                  height: scrHeight*0.666,
                  // /   color: Colors.red,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return   InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ModuleSummery(),));
                        },
                        child: Container(
                          width: scrWidth*0.85,
                          height: scrHeight*0.15,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Module 1: Love Across Time ",
                                          style: GoogleFonts.montserrat(
                                              fontSize: scrWidth*0.035,
                                              fontWeight: FontWeight.w700
                                          ),),
                                        SvgPicture.asset("assets/images/tick.svg")
                                      ],
                                    ),
                                    Text("22nd September 2024",
                                      style: GoogleFonts.inter(
                                          fontSize: scrWidth*0.024,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height: scrHeight*0.02,
                                    ),
                                    Container(
                                      width: scrWidth*0.8,
                                      height: scrHeight*0.05,
                                      //color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: scrWidth*0.1,
                                                height: scrHeight*0.023,
                                                decoration: BoxDecoration(
                                                    color: ColorPalette.yellow,
                                                    borderRadius:BorderRadius.circular(scrWidth*0.01)
                                                ),
                                                child: Center(
                                                  child: Text("View",style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: scrWidth*0.019,
                                                  ),),
                                                ),
                                              ),
                                              SizedBox(width: scrWidth*0.01,),
                                              SvgPicture.asset("assets/images/details.svg",width: scrWidth*0.05,)
                                            ],
                                          ),
                                          SvgPicture.asset("assets/images/delete.svg")

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

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
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
