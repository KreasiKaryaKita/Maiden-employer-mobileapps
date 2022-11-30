import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/detail_helper/controllers/detail_helper_controller.dart';

class DocumentPreviewView extends GetView<DetailHelperController> {
  final String pdfPath;
  DocumentPreviewView({super.key, required this.pdfPath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.helperDetail.value.fullName?.toUpperCase() ?? '',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        leading: BackButton(onPressed: () => Get.back(), color: const Color(0xFF505F70)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PDFView(
                fitEachPage: true,
                filePath: pdfPath,
                enableSwipe: true,
                fitPolicy: FitPolicy.BOTH,
                swipeHorizontal: false,
                pageSnap: false,
                autoSpacing: true,
                pageFling: false,
                onRender: (pages) {},
                onError: (error) {
                  if (kDebugMode) {
                    print('==>$error');
                  }
                },
                onPageError: (page, error) {
                  if (kDebugMode) {
                    print('==> $page: ${error.toString()}');
                  }
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  if (!controller.pdfController.isCompleted) {
                    controller.pdfController.complete(pdfViewController);
                  }
                  if (kDebugMode) {
                    print('==> page created');
                  }
                },
                onPageChanged: (int? page, int? total) {
                  if (kDebugMode) {
                    print('==> page change: $page/$total');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
