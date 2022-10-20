import 'package:flutter/material.dart';

Future<bool?> alertHelperDefault(
    {required BuildContext context,
    bool isDissmissible = true,
    bool isRevert = false,
    required String title,
    required String content,
    String? yesTitle,
    String? noTitle,
    Function? onYesPressed,
    Function? onNoPressed}) async {
  return await showDialog<bool>(
      context: context,
      barrierDismissible: isDissmissible,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            noTitle != null
                ? TextButton(
                    onPressed: () async {
                      if (isDissmissible) isRevert ? Navigator.of(context).pop(true) : Navigator.of(context).pop(false);
                      if (onNoPressed != null) await onNoPressed();
                    },
                    child: Text(noTitle))
                : Container(),
            yesTitle != null
                ? TextButton(
                    onPressed: () async {
                      if (isDissmissible) isRevert ? Navigator.of(context).pop(false) : Navigator.of(context).pop(true);
                      if (onYesPressed != null) await onYesPressed();
                    },
                    child: Text(yesTitle))
                : Container(),
            yesTitle == null && noTitle == null
                ? TextButton(
                    onPressed: () async {
                      if (isDissmissible) Navigator.of(context).pop(true);
                    },
                    child: Text('Ok'))
                : Container()
          ],
        );
      });
}

Future<bool?> alertHelperNoInternet(
    {required BuildContext context,
    bool isDissmissible = true,
    String? title,
    String? content,
    String? yesTitle,
    Function? onYesPressed}) {
  return alertHelperDefault(
      context: context,
      title: title ?? 'Warning',
      isDissmissible: isDissmissible,
      content: content ?? 'No Internet Connection Detected, check your internet and try again',
      yesTitle: yesTitle,
      onYesPressed: onYesPressed);
}

Future<bool?> alertHelperSomethingWrong(
    {required BuildContext context,
    bool isDissmissible = true,
    String? title,
    String? content,
    String? yesTitle,
    Function? onYesPressed}) {
  return alertHelperDefault(
      context: context,
      title: title ?? 'Ooops',
      isDissmissible: isDissmissible,
      content: content ?? 'Something Went Wrong, please try again later',
      yesTitle: yesTitle,
      onYesPressed: onYesPressed);
}

Future<bool?> alertHelperComingSoon(
    {required BuildContext context,
    bool isDissmissible = true,
    String? title,
    String? content,
    String? yesTitle,
    Function? onYesPressed}) {
  return alertHelperDefault(
      context: context,
      title: title ?? 'Coming Soon',
      isDissmissible: isDissmissible,
      content: content ?? 'Wait for incoming big changes in our App',
      yesTitle: yesTitle,
      onYesPressed: onYesPressed);
}
