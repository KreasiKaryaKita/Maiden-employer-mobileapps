import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_text.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE1464A),
              Color(0xFF8C1D20),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 155,
            height: 45,
          ),
        ),
      ),
    );
  }
}
