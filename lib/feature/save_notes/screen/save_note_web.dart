import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool select=false;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // Sky blue background
      body: Stack(
        children: [
          const CommonBackgroundWeb(i: 2,),
          // Positioned Profile section
          Positioned(
            top: 30,
            right: 40,
            child: Column(
              children: [
                CircleAvatar(
                  radius: scrWidth * 0.03,
                  backgroundImage:
                  const AssetImage("assets/images/profile_image.png"),
                ),
                SizedBox(height: scrHeight * 0.01),
                Text(
                  "Vishnu.M",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: scrWidth * 0.01,
                  ),
                ),
                Text(
                  "Software Engineer",
                  style: GoogleFonts.inter(
                    fontSize: scrWidth * 0.008,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(

              width: scrWidth * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: scrHeight * 0.01),

                  // Favorites Title
                  Text(
                    "Favourites",
                    style: GoogleFonts.montserrat(
                      fontSize: scrWidth * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: scrWidth * 0.04),

                  // Search Bar
                  Container(
                    width: scrWidth * 0.4,
                    height: scrHeight* 0.065,
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

                  // Grid of favorite modules
                  SizedBox(
                    height: scrHeight*0.45,
                    width: scrWidth * 0.5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Thre// e items in a row
                        childAspectRatio: 1.55, // Aspect ratio for the items
                        crossAxisSpacing: scrWidth* 0.025,
                        mainAxisSpacing: scrHeight * 0.025,
                      ),
                      itemBuilder: (context, index) {
                        return const FavoriteCard();
                      },
                      itemCount: 6, // Show 6 items
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
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

