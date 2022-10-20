// ignore_for_file: unnecessary_null_comparison

import '/app/data/networking/api_client.dart';
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
      this.defaultUrl = '/assets/images/users/default.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalUrl = url;
    String baseUrl = ApiClient().baseUrl!.replaceAll('api/', '');

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

    return Center(
        child: CachedNetworkImage(
      imageUrl: finalUrl,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
      placeholder: (ctx, url) => isHavePlacehodler ? Center(child: CircularProgressIndicator()) : Container(),
      errorWidget: (ctx, url, child) => Center(child: Icon(Icons.error_outline, color: Theme.of(context).focusColor)),
    ));
  }
}
