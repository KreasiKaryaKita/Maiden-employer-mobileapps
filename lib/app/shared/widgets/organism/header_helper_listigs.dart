import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/models/entity/option_country_helpers_model.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/search_helper.dart';

class HeaderHelperListings extends StatelessWidget {
  HeaderHelperListings({Key? key}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                'assets/images/people.svg',
                height: 130,
              ),
            ).paddingOnly(right: 20),
            Text(
              "header".tr,
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ).paddingOnly(left: 20, right: 125, top: 20),
          ],
        ),
        InkWell(
          onTap: () {
            Get.bottomSheet(
              SearchHelper(
                statusBar: MediaQuery.of(context).viewPadding.top,
              ),
              isScrollControlled: true,
              isDismissible: false,
              barrierColor: Colors.transparent,
            );
          },
          child: TextField(
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: AppConstant.SF_PRO_FONT,
            ),
            enabled: false,
            textInputAction: TextInputAction.search,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFE1464A),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFE1464A),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              filled: true,
              fillColor: Color(0xFFFBFBFB),
              hintText: "search".tr,
              hintStyle: const TextStyle(
                color: Color(0xFF6A7178),
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: AppConstant.SF_PRO_FONT,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Color(0xFFE1464A),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Color(0xFFE1464A),
                ),
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Color(0xFFE1464A),
                size: 24,
              ),
            ),
          ).marginOnly(right: 20, left: 20),
        ),
        SizedBox(
          height: 47,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.helpersCountry.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              OptionCountryHelpersModel item = controller.helpersCountry[index];
              return InkWell(
                onTap: () {
                  controller.onSelectCountryFilter(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        controller.helpersCountrySelected.value == item.value ? Color(0xFFC9283E) : Color(0xFFC37C7E),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    item.label!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppConstant.SF_PRO_FONT,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ).marginOnly(top: 20),
      ],
    );
  }
}
