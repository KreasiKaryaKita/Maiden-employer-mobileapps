import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

class IntroPage extends StatelessWidget {
  final String assetImage;
  final String text;
  final String title;

  const IntroPage(this.assetImage, this.title, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                assetImage,
              ).marginOnly(top: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title.tr,
                  style: TextStyle(
                    color: Color(0xFF272B30),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                  ),
                ),
              ).marginOnly(top: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text.tr,
                  style: TextStyle(
                    color: Color(0xFF66798F),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: AppConstant.SF_PRO_FONT,
                    height: 1.5,
                  ),
                ),
              ).marginOnly(top: 8, bottom: 20),
            ],
          ),
        ),
      ),
    );
  }
}
