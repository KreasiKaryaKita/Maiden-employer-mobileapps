// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  final bool isHavePlacehodler;
  final BoxFit fit;
  final Alignment alignment;
  final bool isNeedBaseUrl;
  final bool isHaveDefault;
  final String defaultUrl;
  CachedNetworkImageWidget(
      {Key? key,
      required this.url,
      this.isHavePlacehodler = true,
      this.fit = BoxFit.contain,
      this.alignment = Alignment.center,
      this.isNeedBaseUrl = true,
      this.isHaveDefault = false,
      this.defaultUrl = AppConstant.DEFAULT_AVATAR})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalUrl = url;
    final baseUrl =
        dotenv.env['APP_ENV'] == 'dev' ? dotenv.env['BASE_URL_MEDIA_DEV'] : dotenv.env['BASE_URL_MEDIA_PROD'];
    if (url == null || url.isEmpty || url == '-') {
      if (isHaveDefault) {
        finalUrl = '$baseUrl$defaultUrl';
      } else {
        finalUrl = '-';
      }
    } else {
      if (isNeedBaseUrl) {
        if (!url.contains('http')) {
          finalUrl = '$baseUrl$url';
        }
      }
    }
    print(finalUrl);

    return Center(
      child: CachedNetworkImage(
        imageUrl: finalUrl,
        fit: fit,
        alignment: alignment,
        width: double.infinity,
        height: double.infinity,
        placeholder: (ctx, url) => isHavePlacehodler
            ? SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFC9283E),
                    strokeWidth: 3,
                  ),
                ),
              )
            : Container(),
        errorWidget: (ctx, url, child) => Center(
          child: Icon(Icons.error_outline, color: Theme.of(context).focusColor),
        ),
      ),
    );
  }
}
