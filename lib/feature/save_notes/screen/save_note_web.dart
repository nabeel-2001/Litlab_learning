import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/save_notes/controller/save_note_controller.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/feature/save_notes/controller/save_note_controller.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litlab_learning/feature/save_notes/screen/save_note_web_main.dart';
import 'package:litlab_learning/model/users_model.dart';

class FavoritesPageState extends ConsumerStatefulWidget {


  @override
  _FavoritesPageStateState createState() => _FavoritesPageStateState();
}

class _FavoritesPageStateState extends ConsumerState<FavoritesPageState> {

  final materials=StateProvider((ref) => [],);
  getFavoriteMaterials(UserModel data ) async {
    ref.read(materials.notifier).state=
  await ref.watch(notesControllerProvider.notifier).fetchNotesForCourse(data.course, data.favourite);

 }

  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    final notesControllerState = ref.watch(notesControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        return true; // Allow the pop
      },
      child: Scaffold(
        body: Stack(
          children: [
            const CommonBackgroundWeb(i: 2),
            Positioned(
              top: 30,
              right: 40,
              child: Column(
                children: [
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
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(height: scrHeight * 0.01),
                  Text(
                    user!.name.toString(),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: scrWidth * 0.01,
                    ),
                  ),
                  Text(
                    user!.collegeName.toString(),
                    style: GoogleFonts.inter(
                      fontSize: scrWidth * 0.008,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ref.watch(currentUser(user.id)).when(
              data: (data)  {
                if (data.favourite.isNotEmpty) {
                  getFavoriteMaterials(data);
                 final note= ref.watch(materials);
                  return Center(
                    child: SizedBox(
                      width: scrWidth * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: scrHeight * 0.01),
                          GestureDetector(
                            onTap: () {
                              favouritePageView = '/module';
                              print(favouritePageView);
                              setState(() {

                              });
                            },
                            child: Text(
                              "Favourites",
                              style: GoogleFonts.montserrat(
                                fontSize: scrWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: scrWidth * 0.04),
                          Container(
                            width: scrWidth * 0.4,
                            height: scrHeight * 0.065,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/search.svg",
                                    width: scrWidth * 0.015,
                                  ),
                                  SizedBox(width: scrWidth * 0.01),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Search notes, materials & more",
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: scrWidth * 0.01,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: scrHeight * 0.03),
                          SizedBox(
                            height: scrHeight * 0.45,
                            width: scrWidth * 0.5,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.55,
                                crossAxisSpacing: scrWidth * 0.025,
                                mainAxisSpacing: scrHeight * 0.025,
                              ),
                              itemCount: note.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      favouritePageView = '/module';
                                      print(favouritePageView);
                                      setState(() {

                                      });
                                    },
                                    child: FavoriteCard()); // Pass the note to FavoriteCard
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text("No Data"));
                }
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
            ),
          ],
        ),
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
                SvgPicture.asset("assets/images/select_favorite.svg",
                  width: scrWidth * 0.01,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
