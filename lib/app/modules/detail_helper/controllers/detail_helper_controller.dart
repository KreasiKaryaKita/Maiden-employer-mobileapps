// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_helper_detail.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';

class DetailHelperController extends GetxController {
  var isLoading = true.obs;
  RxDouble count = 0.0.obs;
  var arguments = {}.obs;
  var helperDetail = HelperDetailModel().obs;

  RxList languageSkills = [].obs;

  RxList workSkills = [].obs;

  RxList willing = [].obs;

  RxList workExperience = [].obs;

  RxList vaccination = [].obs;

  RxList workDuties = [
    {
      "icon": "assets/images/Baby.svg",
      "label": "Infant Care",
    },
    {
      "icon": "assets/images/Boy.svg",
      "label": "Child Care",
    },
    {
      "icon": "assets/images/Elderly-Person.svg",
      "label": "Elderly Care",
    },
    {
      "icon": "assets/images/Corgi.svg",
      "label": "Walk the dog",
    },
    {
      "icon": "assets/images/Fiat-500.svg",
      "label": "Car Washing",
    },
    {
      "icon": "assets/images/Lawn-Mower.svg",
      "label": "Gardening",
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    arguments.value = Get.arguments;
    getDetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDetail() {
    isLoading.value = true;
    ApiRepositories.helperDetail(id: arguments.value['id']).then((value) {
      isLoading.value = false;
      if (value is ResponseHelperDetail) {
        helperDetail.value = value.data!;

        if (value.data!.language != null && value.data!.language!.isNotEmpty) {
          languageSkills.assignAll(value.data!.language!.map((e) => {
                "value": e.answer,
                "label": e.question,
              }));
        }

        if (value.data!.helperSkills != null) {
          var tempSkills = [
            'Infant Care (<1yo)',
            'Child Care',
            'Elderly Care',
            'Disabled/Special Needs Care',
            'General Housekeeping',
            'Laundry',
            'Cooking',
            'Pet Care'
          ];

          var tempImgSkills = [
            "assets/images/Baby.svg",
            "assets/images/Boy.svg",
            "assets/images/Elderly-Person.svg",
            "assets/images/Elderly-Person.svg",
            "assets/images/Fiat-500.svg",
            "assets/images/Lawn-Mower.svg",
            "assets/images/Lawn-Mower.svg",
            "assets/images/Corgi.svg"
          ];

          if (value.data!.helperSkills!.skillPriority1 != null && value.data!.helperSkills!.skillPriority1 != '') {
            var search1 = tempSkills.indexWhere((e) => e == value.data!.helperSkills!.skillPriority1);
            workSkills.add({
              "icon": search1 == -1 ? tempImgSkills[0] : tempImgSkills[search1],
              "label": value.data!.helperSkills!.skillPriority1,
            });
          }

          if (value.data!.helperSkills!.skillPriority2 != null && value.data!.helperSkills!.skillPriority2 != '') {
            var search2 = tempSkills.indexWhere((e) => e == value.data!.helperSkills!.skillPriority2);
            workSkills.add({
              "icon": search2 == -1 ? tempImgSkills[0] : tempImgSkills[search2],
              "label": value.data!.helperSkills!.skillPriority2,
            });
          }

          if (value.data!.helperSkills!.skillPriority3 != null && value.data!.helperSkills!.skillPriority3 != '') {
            var search3 = tempSkills.indexWhere((e) => e == value.data!.helperSkills!.skillPriority3);
            workSkills.add({
              "icon": search3 == -1 ? tempImgSkills[0] : tempImgSkills[search3],
              "label": value.data!.helperSkills!.skillPriority3,
            });
          }

          if (value.data!.helperSkills!.skillPriority4 != null && value.data!.helperSkills!.skillPriority4 != '') {
            var search4 = tempSkills.indexWhere((e) => e == value.data!.helperSkills!.skillPriority4);
            workSkills.add({
              "icon": search4 == -1 ? tempImgSkills[0] : tempImgSkills[search4],
              "label": value.data!.helperSkills!.skillPriority4,
            });
          }

          if (value.data!.helperSkills!.skillPriority5 != null && value.data!.helperSkills!.skillPriority5 != '') {
            var search5 = tempSkills.indexWhere((e) => e == value.data!.helperSkills!.skillPriority5);
            workSkills.add({
              "icon": search5 == -1 ? tempImgSkills[0] : tempImgSkills[search5],
              "label": value.data!.helperSkills!.skillPriority5,
            });
          }

          if (value.data!.willingAbleTo != null && value.data!.willingAbleTo!.isNotEmpty) {
            var tempAble = [
              'handle pork',
              'consume Pork',
              'handle Beef',
              'Wash car',
              'take care of dog',
              'Gardening Work',
              'simple Sewing',
              'Adjust Prayer Schedule',
              'Work Without Hijab',
              'Share Room'
            ];

            var tempImgAble = [
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Fiat-500.svg",
              "assets/images/Corgi.svg"
                  "assets/images/Lawn-Mower.svg",
              "assets/images/Lawn-Mower.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
            ];

            for (var i = 0; i < value.data!.willingAbleTo!.length; i++) {
              var searchwil = tempAble.indexWhere((e) => e == value.data!.willingAbleTo![i].question);
              willing.add({
                "icon": searchwil == -1 ? tempImgAble[0] : tempImgSkills[searchwil],
                "label": value.data!.willingAbleTo![i].question,
              });
            }
          }

          workExperience.assignAll(value.data!.experience!.map((e) => {
                "year": '${e.from} - ${e.to}',
                "label": e.country,
                "name": e.name,
                "ethnicity": e.ethnicity,
                "no_of_pax": e.noOfPax,
                "house_type": e.houseType,
                "work_duties": e.workDuties!.map((e) => e.question).toList(),
                "reason_termination": e.reasonTermination
              }));

          vaccination.assignAll(value.data!.vaccination!.map((e) => {
                "step": "3rd Dose - Booster",
                "label": "27 February 2021",
                "type": "Sinovac",
              }));

          if (value.data!.vaccination != null &&
              value.data!.vaccination!.isNotEmpty &&
              value.data!.vaccination![0].vaccine != null) {
            for (var i = 0; i < value.data!.vaccination![0].vaccine!.length; i++) {
              String vaccineKe = '1st';

              if (i == 1) {
                vaccineKe = '2nd';
              } else if (i == 2) {
                vaccineKe = '3rd';
              }

              vaccination.add({
                "step": "$vaccineKe Dose ${i == 2 ? '- Booster' : ''}",
                "label": value.data!.vaccination![0].vaccine![i].date,
                "type": value.data!.vaccination![0].vaccine![i].type,
              });
            }
          }
        }
      } else {
        Get.back();
        CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: value?.message ?? '');
      }
    }, onError: (e) {
      Get.back();
      CommonFunction.snackbarHelper(isSuccess: false, title: 'Failed', message: e.toString());
    });
  }

  updateCount(value) {
    count.value = value;
    printInfo(info: count.toString());
  }
}
