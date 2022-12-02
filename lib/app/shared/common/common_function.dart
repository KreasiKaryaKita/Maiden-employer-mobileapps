// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';

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

  static createPasswordSuccess() {
    return Get.dialog(
      barrierDismissible: false,
      barrierColor: Color(0xFF333333).withOpacity(0.8),
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => Get.close(2),
                      icon: SvgPicture.asset(
                        'assets/images/icon-close.svg',
                        height: 20,
                        width: 20,
                      ),
                    ).marginOnly(top: 8, right: 8),
                    Center(
                      child: Text(
                        "change_password_success".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                        ),
                      ).marginOnly(top: 12),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/undraw_accept_terms.svg',
                        height: 200,
                        width: 107,
                      ).marginOnly(top: 24),
                    ),
                    Center(
                      child: ButtonText(
                        onPressed: () {
                          Get.close(2);
                        },
                        text: Text(
                          "new_password_created_log_in".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFE1464A),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                        ).marginOnly(top: 36, bottom: 40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
