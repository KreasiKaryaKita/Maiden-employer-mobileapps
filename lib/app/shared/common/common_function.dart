// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

import '/app/shared/widgets/images/cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunction {
  static loadingShow({String message = "msg_loading"}) {
    return Get.dialog(
      barrierDismissible: false,
      barrierColor: Color(0xFF333333).withOpacity(0.8),
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitCircle(
                color: Colors.white,
                size: 60.0,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: AppConstant.SF_PRO_FONT,
                ),
                child: Text(
                  message.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: AppConstant.SF_PRO_FONT,
                  ),
                ).marginOnly(top: 15.5),
              ),
            ],
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
    return Get.rawSnackbar(
      messageText: Text(
        message != null
            ? (message is List)
                ? message.join("\n")
                : (message.length > 100 ? message.substring(0, 100) : message)
            : '',
        style: TextStyle(
          color: Colors.white,
          fontFamily: AppConstant.SF_PRO_FONT,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      backgroundColor: isSuccess ? Color(0xFF29823B) : Color(0xFFDC2020),
      duration: duration,
      barBlur: 8.0,
      borderRadius: 10,
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
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 30),
      // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 21),
      icon: Icon(
        isSuccess ? Icons.check_rounded : Icons.warning_amber_rounded,
        color: Colors.white,
        size: 24,
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: Offset(0, 10),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
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
