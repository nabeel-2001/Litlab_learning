import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/common_background.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/assets_image_constant.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/materials/screen/material_Page.dart';
import 'package:litlab_learning/model/users_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends ConsumerState<HomeScreen> {
// getCourseDetails(String courseId) async {
//
//   await ref.read(materialControllerProvider.notifier).getMaterial(courseId);
// }

  getUser() async {
    var box = await Hive.openBox('userBox');
    UserModel? user = box.get('currentUser');
    ref.read(userProvider.notifier).state=user;
  }
  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    return Scaffold(
      body: Stack(
        children: [
          const  CommonBackground(),
          user==null?const Center(child: CircularProgressIndicator()): Center(
            child: SizedBox(
              width: scrWidth*0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: scrWidth*0.3,
                    height: scrWidth*0.05,
                    // color: Colors.red,
                    child: Text(user!.course.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: scrWidth*0.035
                      ),),
                  ),
                  SizedBox(
                    height: scrHeight*0.03,
                  ),
                  Column(

                    children: [
                      InkWell(
                        onTap: () {
                          // Navigate to the materials page by selecting index 3
                          Navigator.pushNamed(context, "sideBar_Page/material_pageWeb");
                          ref.read(selectedPageIndexProvider.notifier).state = 3;  // Update the selected page index to Material Page
                        },
                        child: Container(
                          width: scrWidth*0.4,
                          height: scrHeight*0.15,
                          color: ColorPalette.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Major Paper",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: scrWidth*0.03
                                ),
                              ),
                              SizedBox(
                                width: scrWidth*0.02,
                              ),
                              SvgPicture.asset(AssetConst.coreIcon,
                                width: scrWidth*0.03,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: scrWidth*0.03,
                      ),
                      Container(
                        width: scrWidth*0.4,
                        height: scrHeight*0.15,
                        color: ColorPalette.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Common Paper",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: scrWidth*0.03
                              ),

                            ),
                            SizedBox(
                              width: scrWidth*0.01,
                            ),
                            SvgPicture.asset(AssetConst.commonPaper,
                            width: scrWidth*0.03,)
                          ],
                        ),
                      )
                    ],
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
