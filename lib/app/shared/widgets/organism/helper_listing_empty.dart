import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_helper.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';

class HelperListingEmpty extends StatelessWidget {
  HelperListingEmpty({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HelperListingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/super_woman.svg',
          height: 225,
        ).marginOnly(top: 80),
        Text(
          'filter_results_empty'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: AppConstant.SF_PRO_FONT,
          ),
        ).paddingSymmetric(horizontal: 32).marginOnly(top: 32),
        if (controller.isFiltered.value)
          ButtonFill(
            onPressed: () {
              Get.bottomSheet(
                FilterHelper(statusBar: MediaQuery.of(context).viewPadding.top),
                isScrollControlled: true,
                isDismissible: false,
                barrierColor: Colors.transparent,
              );
            },
            backgroundColor: Colors.white,
            height: 48,
            width: 170,
            text: Text(
              'filter_results_empty_button'.tr,
              style: TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontFamily: AppConstant.SF_PRO_FONT,
              ),
            ),
          ).marginOnly(top: 10)
      ],
    );
  }
}
