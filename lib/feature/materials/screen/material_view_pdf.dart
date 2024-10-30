
import 'package:flutter/material.dart';


import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// class MaterialPdfView extends StatefulWidget {
//   final String pdfUrl;
//   const MaterialPdfView({super.key, required this.pdfUrl});
//   @override
//   State<MaterialPdfView> createState() => _MaterialPdfViewState();
// }
//
// class _MaterialPdfViewState extends State<MaterialPdfView> {
//
//   @override
//   void initState() {
//     print(widget.pdfUrl);
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading:  IconButton(icon: const Icon(Icons.arrow_back_outlined),
//             onPressed: () {
//               Navigator.pop(context);
//             },),
//         ),
//         body: SfPdfViewer.network(
//             enableDoubleTapZooming: true,
//
//
//             widget.pdfUrl));
//   }
// }

class MaterialPdfView extends StatefulWidget {
  final String pdfUrl;
  const MaterialPdfView({super.key, required this.pdfUrl});

  @override
  State<MaterialPdfView> createState() => _MaterialPdfViewState();


}

class _MaterialPdfViewState extends State<MaterialPdfView> {

  @override
  void initState() {
    print(widget.pdfUrl);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:  IconButton(icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },),
        ),
        body: SfPdfViewer.network(
            enableDoubleTapZooming: true,


            widget.pdfUrl));
  }
}

