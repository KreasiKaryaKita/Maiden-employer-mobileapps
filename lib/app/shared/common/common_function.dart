// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:maiden_employer/app/config/themes/app_colors.dart';

import '/app/shared/widgets/images/cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunction {
  static loadingShow() {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const CircularProgressIndicator(
            color: AppColors.primary_60,
          ),
        ),
      ),
    );
  }

  static loadingHide() {
    if (Get.isDialogOpen ?? false) Navigator.of(Get.overlayContext!).pop();
  }

  static snackbarHelper({
    String? title,
    dynamic message,
    bool isSuccess = true,
    void Function()? mainButtonOnPressed,
    Widget? mainButton,
    Duration duration = const Duration(seconds: 4),
  }) {
    return Get.snackbar(
      title ?? (isSuccess ? 'Success' : 'Error'),
      message != null
          ? (message is List)
              ? message.join("\n")
              : (message.length > 100 ? message.substring(0, 100) : message)
          : '',
      backgroundColor: isSuccess ? Colors.green.withOpacity(0.7) : Colors.red.withOpacity(0.7),
      duration: duration,
      barBlur: 8.0,
      mainButton: mainButtonOnPressed == null
          ? null
          : TextButton(
              onPressed: mainButtonOnPressed,
              child: mainButton ??
                  Text(
                    'Lihat',
                    style: TextStyle(color: Colors.white),
                  ),
            ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 30),
      icon: Icon(isSuccess ? Icons.check_circle : Icons.error, color: Colors.white),
    );
  }

  static zoomImage(String url, {String? title}) {
    Get.dialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InteractiveViewer(
            minScale: 1,
            maxScale: 5,
            child: Container(
              width: Get.size.width,
              height: 1 / 2 * Get.size.height,
              color: Colors.white,
              child: CachedNetworkImageWidget(
                url: url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (title != null)
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ).marginAll(16)
        ],
      ),
      barrierDismissible: true,
    );
  }
}
