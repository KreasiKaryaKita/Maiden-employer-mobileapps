import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/schedule_interview_controller.dart';

class ScheduleInterviewView extends GetView<ScheduleInterviewController> {
  const ScheduleInterviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF820333),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          "schedule_interview_title".tr.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppConstant.SF_PRO_FONT,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: Container(
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
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    children: [
                      Text(
                        "${'schedule_interview_desc'.tr} ${controller.helperDetail.value.fullName ?? ''}",
                        style: TextStyle(
                          fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ).marginOnly(bottom: 20),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white,
                      ).marginOnly(bottom: 26),
                      Text(
                        'schedule_interview_select_date'.tr,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ).marginOnly(bottom: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFADB5BD)),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        child: TableCalendar(
                          firstDay: controller.firstDay.value,
                          lastDay: controller.lastDay.value,
                          focusedDay: controller.focusedDay.value,
                          availableGestures: AvailableGestures.horizontalSwipe,
                          locale: Get.locale.toString(),
                          selectedDayPredicate: (day) {
                            return isSameDay(controller.selectedDay.value, day);
                          },
                          enabledDayPredicate: (day) {
                            return day.isAfter(controller.firstDay.value.subtract(Duration(days: 1)));
                            // return !controller.notAvailable.contains(
                            //   DateTime(day.year, day.month, day.day),
                            // );
                          },
                          headerStyle: HeaderStyle(
                            leftChevronVisible: true,
                            rightChevronVisible: true,
                            headerPadding: EdgeInsets.only(left: 32.0, right: 32, top: 12, bottom: 14),
                            titleTextStyle: TextStyle(
                              color: Color(0xFF44B5BC),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            leftChevronIcon: Icon(
                              Icons.chevron_left_rounded,
                              color: Color(0xFF6A7178),
                              size: 28,
                            ).paddingAll(8),
                            rightChevronIcon: Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFF6A7178),
                              size: 28,
                            ).paddingAll(8),
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          daysOfWeekHeight: 30,
                          calendarStyle: CalendarStyle(
                            todayDecoration: const BoxDecoration(
                              color: Color(0xFFFFA0A3),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            selectedDecoration: const BoxDecoration(
                              color: Color(0xFFE1464A),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                            ),
                            todayTextStyle: const TextStyle(
                              color: Color(0xFF272B30),
                              fontSize: 14,
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                            ),
                            defaultTextStyle: const TextStyle(
                              color: Color(0xFF272B30),
                              fontSize: 14,
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w400,
                            ),
                            defaultDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            weekendDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            rangeEndDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            rangeStartDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            withinRangeDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            outsideDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            holidayDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          calendarBuilders: CalendarBuilders(
                            dowBuilder: (context, day) {
                              return Center(
                                child: Text(
                                  DateFormat.E(Get.locale.toString()).format(day),
                                  style: const TextStyle(
                                    color: Color(0xFF6A7178),
                                    fontSize: 14,
                                    fontFamily: AppConstant.SF_PRO_FONT,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                            disabledBuilder: (context, day, focusedDay) {
                              if (day.isBefore(controller.firstDay.value) || day.isAfter(controller.lastDay.value)) {
                                return Center(
                                  child: Container(
                                    margin: EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Color.fromARGB(255, 243, 243, 243),
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      day.day.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 195, 199, 204),
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Container(
                                    margin: EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Color(0xFFF1F3F5),
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      day.day.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFDEE2E6),
                                        fontSize: 14,
                                        fontFamily: AppConstant.SF_PRO_FONT,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          onDaySelected: (selectedDay, focusedDay) {
                            controller.setSelectedDay(selectedDay);
                          },
                          onPageChanged: (focusedDay) {
                            printInfo(info: focusedDay.toString());
                          },
                        ),
                      ).marginOnly(bottom: 20),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white,
                      ).marginOnly(bottom: 26),
                      Text(
                        'schedule_interview_select_time'.tr,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ).marginOnly(bottom: 20),
                      SizedBox(
                        height: 47,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var item = controller.timeSlot[index];
                            var isSelected = item.timeLabel == controller.timeSlotSelected.value.timeLabel;
                            var isAvaliable = item.isAvailable ?? false;
                            return ButtonFill(
                              onPressed: () {
                                if (isAvaliable) {
                                  controller.onTimeSlotSelected(item);
                                }
                              },
                              height: 47,
                              width: 106,
                              radius: 5,
                              backgroundColor: isSelected
                                  ? Color(0xFFC9283E)
                                  : isAvaliable
                                      ? Color(0xFFC47C7E)
                                      : Color.fromARGB(255, 243, 243, 243),
                              text: Text(
                                item.timeLabel ?? '-',
                                style: TextStyle(
                                  color: isAvaliable ? Colors.white : Color.fromARGB(255, 195, 199, 204),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstant.SF_PRO_FONT,
                                ),
                              ),
                            ).marginOnly(
                              left: index == 0 ? 0 : 8,
                              right: index == controller.timeSlot.length - 1 ? 0 : 8,
                            );
                          },
                          itemCount: controller.timeSlot.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ).marginOnly(bottom: 20),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white,
                      ).marginOnly(bottom: 26),
                      Text(
                        'schedule_interview_remarks'.tr,
                        style: TextStyle(
                          fontFamily: AppConstant.SF_PRO_FONT,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ).marginOnly(bottom: 20),
                      TextField(
                        controller: controller.inputRemarks,
                        maxLines: 4,
                        cursorColor: Color(0xFF333333),
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: AppConstant.SF_PRO_FONT,
                        ),
                        autofocus: false,
                        textCapitalization: TextCapitalization.none,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCED4DA),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFCED4DA),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "schedule_interview_remarks_hint".tr,
                          hintStyle: const TextStyle(
                            color: Color(0xFFCED4DA),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppConstant.SF_PRO_FONT,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color(0xFFCED4DA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color(0xFFCED4DA),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFF820333),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "${DateFormat('dd MMM yyyy').format(controller.selectedDay.value)}\n${controller.timeSlotSelected.value.timeLabel ?? '-'}",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: AppConstant.SF_PRO_FONT,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ButtonFill(
                          onPressed: controller.onSetSchedulePressed,
                          backgroundColor: Colors.white,
                          height: 48,
                          text: Text(
                            'schedule_interview_button'.tr,
                            style: TextStyle(
                              color: Color(0xFFE1464A),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: AppConstant.SF_PRO_FONT,
                            ),
                          ),
                        ).marginOnly(left: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
