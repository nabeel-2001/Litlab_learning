import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/save_notes/controller/save_note_controller.dart';
import 'package:litlab_learning/model/users_model.dart';

class SaveNote extends ConsumerStatefulWidget {
  const SaveNote({super.key});

  @override
  ConsumerState<SaveNote> createState() => _SaveNoteState();
}

class _SaveNoteState extends ConsumerState<SaveNote> {
  final materials=StateProvider((ref) => [],);
  getFavoriteMaterials(UserModel data ) async {
    ref.read(materials.notifier).state=
    await ref.watch(notesControllerProvider.notifier).fetchNotesForCourse(data.course, data.favourite);

  }
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    return Scaffold(
      body: Stack(
        children: [
          const CommonBackground(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
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

                              fontSize: scrWidth*0.04,
                              fontWeight: FontWeight.w700
                          ),),
                      ),
                      CachedNetworkImage(
                        imageUrl: user!.image.toString(),
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
                        errorWidget: (context, url, error) =>CircleAvatar(
                          radius: scrWidth*0.04,
                          backgroundImage: const AssetImage("assets/images/profile_image.png",),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: scrHeight*0.05,
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
                  height: scrHeight*0.04,
                ),
                ref.watch(currentUser(user.id)).
                    when(
                  data: (data) {
                    if (data.favourite.isNotEmpty) {
                      getFavoriteMaterials(data);
                      final note = ref.watch(materials);
                      return SingleChildScrollView(
                        child: SizedBox(
                          height: scrHeight * 0.55,
                          width: scrWidth * 1,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.7,
                              crossAxisSpacing: scrWidth * 0.04,
                              mainAxisSpacing: scrWidth * 0.05,

                            ),
                            itemCount:note.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),


                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (
                                        context) => const ModuleSummery(),));
                                },
                                child: Container(
                                  width: scrWidth * 0.45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          scrWidth * 0.02),
                                      border: Border.all(
                                          color: ColorPalette.black,
                                          width: scrWidth * 0.001
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          height: scrHeight * 0.02,
                                        ),
                                        Text("Module 1: Love Across Time ",
                                          style: GoogleFonts.montserrat(
                                              fontSize: scrWidth * 0.024,
                                              fontWeight: FontWeight.w700
                                          ),),
                                        Text("22nd September 2024",
                                          style: GoogleFonts.inter(
                                              fontSize: scrWidth * 0.018,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        SizedBox(
                                          height: scrHeight * 0.03,
                                        ),
                                        SizedBox(
                                          width: scrWidth * 0.25,
                                          height: scrHeight * 0.03,
                                          //color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(context, "sideBar_Page/material_pageWeb/module_summery");
                                                },
                                                child: Container(
                                                  width: scrWidth * 0.2,
                                                  height: scrHeight * 0.03,
                                                  decoration: BoxDecoration(
                                                      color: ColorPalette.yellow,
                                                      borderRadius: BorderRadius
                                                          .circular(scrWidth * 0.01)
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Text("Read Summary",
                                                        style: GoogleFonts.inter(
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: scrWidth *
                                                              0.018,
                                                        ),),
                                                      Icon(Icons
                                                          .remove_red_eye_outlined,
                                                        size: scrWidth * 0.04,)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/like.svg")
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
                      );
                    }
                    else {
                      return const Center(child: Text("No Data"));
                    }
                  }
                  ,
                  error: (err, stack) => Text(err.toString()) ,
                  loading: () => CircularProgressIndicator(),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
