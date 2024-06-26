// import 'dart:io';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class pdf_view extends StatelessWidget {
  pdf_view({Key? key}) : super(key: key);

  // final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
        ),
        body: SfPdfViewer.network(
          'https://firebasestorage.googleapis.com/v0/b/teastlearingapp.appspot.com/o/Network%20Presentation.pdf?alt=media&token=706287c8-b7b9-4c94-83a9-d87cc9471863',
          canShowPageLoadingIndicator: false,
          currentSearchTextHighlightColor: Colors.red,
        )
        // SfPdfViewer.asset('assets/Network.pdf')
        );
  }
}
// Future<void> mainn() async {
//   // final font = await PdfGoogleFonts.nunitoExtraLight();
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) => pw.Center(
//         child: pw.Text('Hello World!'),
//       ),
//     ),
//   );
//
//   final file = File('example.pdf');
//   await file.writeAsBytes(await pdf.save());
// }

// void ss(){
//   PDFView(
//     filePath: path,
//     enableSwipe: true,
//     swipeHorizontal: true,
//     autoSpacing: false,
//     pageFling: false,
//     onRender: (_pages) {
//       setState(() {
//         pages = _pages;
//         isReady = true;
//       });
//     },
//     onError: (error) {
//       print(error.toString());
//     },
//     onPageError: (page, error) {
//       print('$page: ${error.toString()}');
//     },
//     onViewCreated: (PDFViewController pdfViewController) {
//       _controller.complete(pdfViewController);
//     },
//     onPageChanged: (int page, int total) {
//       print('page change: $page/$total');
//     },
//   ),
// }
