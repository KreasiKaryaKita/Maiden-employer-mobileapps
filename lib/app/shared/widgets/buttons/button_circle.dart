import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final void Function()? onPressed;
  final Icon icon;
  final Color? backgroundColor;

  final EdgeInsets margin;
  final EdgeInsets padding;

  const ButtonCircle(
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        splashColor: Colors.white,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
