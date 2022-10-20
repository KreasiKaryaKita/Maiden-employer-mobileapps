import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppbarDefault extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? action;
  const AppbarDefault({Key? key, this.leading, this.title, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, Get.mediaQuery.padding.top + 10, 0, 10),
      child: Row(
        children: [
          Expanded(child: leading ?? SizedBox()),
          Expanded(
              flex: 4,
              child: Center(
                child: title ??
                    Text(
                      'get_started'.tr.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Color(0xFF212121)),
                    ),
              )),
          Expanded(
              child: action ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset('assets/images/icon-close.svg')),
                    ],
                  )),
        ],
      ),
    );
  }
}
