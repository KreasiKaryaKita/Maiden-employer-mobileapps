import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_helper.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/search_helper.dart';

class HeaderFilterResult extends StatelessWidget {
  HeaderFilterResult({Key? key}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          (controller.helpers.isNotEmpty)
              ? FilterHelper(statusBar: MediaQuery.of(context).viewPadding.top)
              : SearchHelper(statusBar: MediaQuery.of(context).viewPadding.top),
          isScrollControlled: true,
          isDismissible: false,
          barrierColor: Colors.transparent,
        );
      },
      child: Row(
        children: [
          IconButton(
            onPressed: () => controller.onClearSearch(),
            icon: Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFBFBFB),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Color(0xFFE1464A)),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: Color(0xFFE1464A),
                    size: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(builder: (context) {
                          var selecteds = controller.helpersWorkSkill.where((p) => p.selected ?? false).toList();
                          if (selecteds.isEmpty) {
                            return SizedBox();
                          } else {
                            return Text(
                              selecteds.length > 1
                                  ? '${selecteds[0].label!},+${selecteds.length - 1}'
                                  : selecteds[0].label!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF6A7178),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: AppConstant.SF_PRO_FONT,
                              ),
                            );
                          }
                        }),
                        Row(
                          children: [
                            if (controller.isMonthYearFiltered.value)
                              Text(
                                '${controller.selectedMonth.value.label} ${controller.selectedYear.value.label}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF6A7178),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: AppConstant.SF_PRO_FONT,
                                ),
                              ),
                            controller.isMonthYearFiltered.value && controller.isAgeFiltered.value
                                ? SizedBox(width: 4, child: Text(','))
                                : SizedBox(width: 4),
                            if (controller.isAgeFiltered.value)
                              Text(
                                '${controller.currentRangeValues.value.start.toStringAsFixed(0)}-${controller.currentRangeValues.value.end.toStringAsFixed(0)} y.o',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF6A7178),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: AppConstant.SF_PRO_FONT,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 8),
                  ),
                  SvgPicture.asset(
                    'assets/images/filter.svg',
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingOnly(right: 20, left: 6, top: 20, bottom: 20),
    );
  }
}
