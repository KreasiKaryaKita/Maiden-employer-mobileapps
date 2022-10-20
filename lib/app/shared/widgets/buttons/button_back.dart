import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBack extends StatelessWidget {
  final Function? onPressed;
  final Widget? icon;
  final Color iconColor;
  const ButtonBack({Key? key, this.onPressed, this.icon, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed != null
            ? Navigator.canPop(context)
                ? onPressed!()
                : () {}
            : Get.back(),
        icon: Navigator.canPop(context) ? icon ?? Icon(Icons.arrow_back, color: iconColor) : SizedBox());
  }
}
