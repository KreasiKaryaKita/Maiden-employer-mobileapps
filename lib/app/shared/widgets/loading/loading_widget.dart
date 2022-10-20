// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final dynamic data;
  final bool isWithDecor;
  final Widget? child;
  final Widget? emptyChild;
  final Widget? loadingWidget;
  final bool isCanLoadMore;
  const LoadingWidget(
      {Key? key,
      required this.isLoading,
      this.data,
      this.isWithDecor = false,
      this.child,
      this.emptyChild,
      this.loadingWidget,
      this.isCanLoadMore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _empty = Center(
      child: Text(
        'Data Kosong',
        style: TextStyle(color: AppColors.primary_20, fontSize: 18),
      ),
    );

    Widget _loading = Center(
      child: Container(
          padding: EdgeInsets.all(24),
          decoration: !isWithDecor
              ? BoxDecoration()
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, spreadRadius: 2)]),
          child: CircularProgressIndicator()),
    );

    if (isLoading) {
      if (isCanLoadMore) {
        if (data is List && data.length > 1) {
          return child ?? SizedBox();
        } else {
          return _loading;
        }
      } else {
        if (loadingWidget != null) {
          return loadingWidget!;
        } else {
          return _loading;
        }
      }
    } else {
      if (data != null) {
        if (data is List && data.length < 1) {
          return emptyChild ?? _empty;
        } else {
          if (isWithDecor) {
            return SizedBox();
          } else {
            return child ?? SizedBox();
          }
        }
      } else {
        return emptyChild ?? _empty;
      }
    }
  }
}
