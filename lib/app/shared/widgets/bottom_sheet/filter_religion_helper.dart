import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/option_religion_helpers_model.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';

class FilterReligionHelper extends StatelessWidget {
  FilterReligionHelper({Key? key, required this.statusBar}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();
  final double statusBar;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF820333),
                const Color(0xFF540032),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                    controller.onSetReligion(false, false);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(
                  "filters_religion".tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppConstant.SF_PRO_FONT,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      controller.onSetReligion(false, true);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        (controller.isAllReligionSelected.value) ? "clear".tr.toUpperCase() : "all".tr.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ).paddingOnly(right: 20),
                    ),
                  ),
                ],
              ).marginOnly(top: statusBar),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: controller.helpersReligion.length,
                  itemBuilder: (context, index) {
                    OptionReligionHelpersModel item = controller.helpersReligion[index];
                    return InkWell(
                      onTap: () {
                        controller.onSelectReligion(index);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.label!,
                              style: TextStyle(
                                fontFamily: AppConstant.SF_PRO_FONT,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ).paddingOnly(right: 10),
                          ),
                          if (item.selected!)
                            Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 18,
                            )
                        ],
                      ).paddingAll(20),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      thickness: 1,
                      color: Color(0xFFC7595C),
                    );
                  },
                ),
              ),
              Container(
                color: Color(0xFF820333),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ButtonFill(
                  onPressed: () {
                    Get.back();
                    controller.onSetReligion(true, false);
                  },
                  backgroundColor: Colors.white,
                  height: 48,
                  text: Text(
                    'filters_apply'.tr,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ),
                ).paddingOnly(bottom: (Platform.isAndroid) ? 0 : 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
