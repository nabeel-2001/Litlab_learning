import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';

class SaveNote extends StatefulWidget {
  const SaveNote({super.key});

  @override
  State<SaveNote> createState() => _SaveNoteState();
}

class _SaveNoteState extends State<SaveNote> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CommonBackground(),
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
                        child: Text("Saved Notes",
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
                  height: scrHeight*0.67,
                  width: scrWidth*1,
                  child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 1.28,
                    crossAxisSpacing: scrWidth*0.04,
                    mainAxisSpacing: scrWidth*0.05,

                  ),
                    itemCount: 8,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),


                    itemBuilder: (context, index) {
                      return  InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ModuleSummery(),));
                        },
                        child: Container(
                          width: scrWidth*0.45,

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(scrWidth*0.02),
                              border: Border.all(
                                  color: ColorPalette.black,
                                  width: scrWidth*0.001
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: scrHeight*0.02,
                                ),
                                Text("Module 1: Love Across Time ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: scrWidth*0.024,
                                      fontWeight: FontWeight.w700
                                  ),),
                                Text("22nd September 2024",
                                  style: GoogleFonts.inter(
                                      fontSize: scrWidth*0.018,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  height: scrHeight*0.02,
                                ),
                                SizedBox(
                                  width: scrWidth*0.25,
                                  height: scrHeight*0.03,
                                  //color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: scrWidth*0.2,
                                        height: scrHeight*0.02,
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
                                      SvgPicture.asset("assets/images/like.svg")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      );

                    },


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
