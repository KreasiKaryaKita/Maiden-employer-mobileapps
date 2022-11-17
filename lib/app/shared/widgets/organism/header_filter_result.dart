import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/modules/helper_listing/controllers/helper_listing_controller.dart';
import 'package:maiden_employer/app/shared/widgets/bottom_sheet/filter_helper.dart';

class HeaderFilterResult extends StatelessWidget {
  HeaderFilterResult({Key? key}) : super(key: key);

  final HelperListingController controller = Get.find<HelperListingController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          FilterHelper(
            statusBar: MediaQuery.of(context).viewPadding.top,
          ),
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
                        Text(
                          "Infact Care, Elderly Care +2",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF6A7178),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Jan 2023, 23-40 y.o",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF6A7178),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
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
