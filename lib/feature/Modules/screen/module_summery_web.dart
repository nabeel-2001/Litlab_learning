import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:litlab_learning/core/common/widgets/common_background_web.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/materials/repository/material_repository.dart';
import 'package:litlab_learning/feature/materials/screen/material_view_pdf.dart';
import 'package:litlab_learning/model/material_model.dart';
import 'package:litlab_learning/model/users_model.dart';

class ModuleSummaryWeb extends ConsumerStatefulWidget {


  const ModuleSummaryWeb({super.key});
  @override
  ConsumerState<ModuleSummaryWeb> createState() => _ModuleSummaryWebState();
}

class _ModuleSummaryWebState extends ConsumerState<ModuleSummaryWeb> {
  MaterialModel? material;
  UserModel? user;
getMaterialDetails() async {

  var box = await Hive.openBox('userBox');
 final  material =await box.get('material');
  final user = await box.get('currentUser');

ref.read(userProvider.notifier).state=user;
ref.read(selectMaterial.notifier).state=material;

}

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

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showConfirmationDialog(context,ref);
        return shouldPop ?? false;

      },
      child: Scaffold(
      
        body: Stack(
          children: [
            CommonBackgroundWeb(i: 2,),
            Padding(
              padding: EdgeInsets.symmetric(
      
                  vertical: scrHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Header (stacking column on mobile, row on tablet/desktop)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                    children: [
        const SizedBox(),
                     user!=null? Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: user.image,
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
                          Text(
                            user?.name.toString()??"unname",
                            style: TextStyle(
                                color: ColorPalette.black, fontSize: scrWidth * 0.01),
                          )
                        ],
                      ):const Center(child: CircularProgressIndicator(),),
                    ],
                  ),
                  // Topic Section
                 material!=null? Container(
                    height: scrHeight * 0.11,
                    width: scrWidth * 0.3  ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth * 0.008),
                      color: ColorPalette.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                material!.title,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: scrWidth * 0.015),
                              ),
                              Text(
                                material.course??"No Data",
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: scrWidth * 0.008),
                              ),
                            ],
                          ),
                          SvgPicture.asset("assets/images/book_4_line.svg"),
                        ],
                      ),
                    ),
                  ):const Center(child: CircularProgressIndicator(),),
                  // Summary Section
                  Container(
                    height: scrHeight * 0.4,
                    width: scrWidth * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(scrWidth * 0.01),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.all(scrWidth * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: scrHeight * 0.05,
                            width: scrWidth * 0.08,
                            decoration: BoxDecoration(
                                color: ColorPalette.yellow,
                                borderRadius: BorderRadius.circular(scrWidth * 0.006)),
                            child: Center(
                              child: Text(
                                "Summary",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: scrWidth * 0.013),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: scrHeight * 0.2,
                            width: scrWidth * 0.2,
                            child: Text(
                              material?.description??""
                              ,style: GoogleFonts.roboto(
                                fontSize: scrWidth * 0.011
                            ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialPdfView(pdfUrl: ref.read(selectMaterial)!.fileUrl,),));
                            },
                            child: Container(
                              height: scrHeight * 0.04,
                              width: scrWidth * 0.12,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(scrWidth * 0.003)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Read the full version",
                                    style: GoogleFonts.cabin(
                                        fontWeight: FontWeight.w600,
                                        fontSize: scrWidth * 0.01),
                                  ),
                                  SizedBox(width: scrWidth * 0.01),
                                  SvgPicture.asset("assets/images/ice.svg",
                                      width: scrWidth * 0.013),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Go to Downloads Button
      
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
// Show a confirmation dialog (optional)
Future<bool?> showConfirmationDialog(BuildContext context,WidgetRef ref) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you want to go back?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Prevent the back action
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              ref.read(selectedPageIndexProvider.notifier).state = 3;
              Navigator.of(context).pop(false); // Allow the back action
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
