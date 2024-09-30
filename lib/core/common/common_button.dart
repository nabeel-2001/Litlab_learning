import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';

class CommonButtons extends StatefulWidget {
  const CommonButtons({super.key});

  @override
  State<CommonButtons> createState() => _CommonButtonsState();
}

class _CommonButtonsState extends State<CommonButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: scrHeight*0.06,
      width: scrWidth*0.95,
      decoration: BoxDecoration(
          color: ColorPalette.yellow,
          borderRadius: BorderRadius.circular(scrWidth*0.04)
      ),
      child:  Center(child: Text("Next",
        style: GoogleFonts.montserrat(
            fontSize:scrWidth*0.05 ,
            fontWeight: FontWeight.bold
        ),)),
    );
  }
}
