import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';

class ButtonFill extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic text;
  final Color? backgroundColor;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double radius;

  ///text can provide string for text only, or widget
  const ButtonFill(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.backgroundColor,
      this.height = 56,
      this.width = double.infinity,
      this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      this.radius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: MaterialButton(
            padding: padding,
            color: backgroundColor ?? Theme.of(context).colorScheme.primary,
            disabledColor: (backgroundColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.3),
            onPressed: onPressed,
            child: text is String
                ? Text(text,
                    style: TextStyle(
                        color: onPressed == null ? AppColors.primary_20 : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2))
                : text),
      ),
    );
  }
}
