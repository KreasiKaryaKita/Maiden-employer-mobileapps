// ignore_for_file: unnecessary_overrides
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/constants/endpoint_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_helper_detail.dart';
import 'package:maiden_employer/app/modules/detail_helper/views/document_preview_view.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailHelperController extends GetxController {
  final Completer<PDFViewController> pdfController = Completer<PDFViewController>();
  final refreshCt = RefreshController();

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

  onRefresh() async {
    isLoading.value = true;
    getDetail();
    refreshCt.refreshCompleted();
  }

  getDetail() {
    isLoading.value = true;
    ApiRepositories.helperDetail(id: arguments['id']).then((value) {
      isLoading.value = false;
      if (value is ResponseHelperDetail) {
        helperDetail.value = value.data!;

        if (value.data!.language != null && value.data!.language!.isNotEmpty) {
          for (var e in value.data!.language!) {
            if (e.answer ?? false) {
              languageSkills.add({
                "value": e.level ?? "-",
                "label": e.question ?? "-",
              });
            }
          }
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
            "assets/images/Lawn-Mower.svg",
            "assets/images/Fiat-500.svg",
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
              "assets/images/Corgi.svg",
              "assets/images/Lawn-Mower.svg",
              "assets/images/Lawn-Mower.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
            ];

            for (var i = 0; i < value.data!.willingAbleTo!.length; i++) {
              var searchwil = tempAble.indexWhere((e) => e == value.data!.willingAbleTo![i].question);
              if (value.data!.willingAbleTo![i].answer ?? false) {
                willing.add({
                  "icon": searchwil == -1 ? "assets/images/worker.svg" : tempImgAble[searchwil],
                  "label": value.data!.willingAbleTo![i].question,
                });
              }
            }
          }

          if (value.data!.experience != null && value.data!.experience!.isNotEmpty) {
            var tempDuties = [
              'Infant Care',
              'Child Care',
              'Elderly Care',
              'Disabled/Special Needs Care',
              'General Housekeeping',
              'Other Work Duties',
              'Cooking',
              'Pet Care'
            ];

            var tempImgDuties = [
              "assets/images/Baby.svg",
              "assets/images/Boy.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Elderly-Person.svg",
              "assets/images/Lawn-Mower.svg",
              "assets/images/Fiat-500.svg",
              "assets/images/Lawn-Mower.svg",
              "assets/images/Corgi.svg"
            ];

            workExperience.assignAll(value.data!.experience!.map((e) {
              var duties = e.workDuties!.where((e) => e.answer != null && e.answer!).map((e) {
                var searchwil = tempDuties.indexWhere((x) => x == e.question!);
                return {
                  'icon': searchwil == -1 ? "assets/images/worker.svg" : tempImgDuties[searchwil],
                  'label': e.question
                };
              }).toList();
              return {
                "from": e.from,
                "to": e.to,
                "country": e.country,
                "name": e.name,
                "ethnicity": e.ethnicity,
                "no_of_pax": e.noOfPax,
                "house_type": e.houseType,
                "work_duties": duties,
                "reason_termination": e.reasonTermination
              };
            }));
          }

          if (value.data!.vaccination != null &&
              value.data!.vaccination!.isNotEmpty &&
              value.data!.vaccination![0].vaccine != null) {
            for (var i = 0; i < value.data!.vaccination![0].vaccine!.length; i++) {
              // String vaccineKe = '1st';

              // if (i == 1) {
              //   vaccineKe = '2nd';
              // } else if (i == 2) {
              //   vaccineKe = '3rd';
              // }

              vaccination.add({
                "step": "Dose ${i + 1}",
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

  String helperCountryImage() {
    var tempCountry = [
      'indonesia',
      'singapore',
      'philippines',
      'myanmar',
      'indian',
      'sri-lanka',
    ];

    var tempCountryImg = [
      "assets/images/icon-country-indonesia.svg",
      "assets/images/icon-country-singapore.svg",
      "assets/images/icon-country-philippines.svg",
      "assets/images/icon-country-myanmar.svg",
      "assets/images/icon-country-indian.svg",
      "assets/images/icon-country-sri-lanka.svg",
    ];

    var search = tempCountry.indexWhere((e) => e.contains(helperDetail.value.country?.toLowerCase() ?? ''));

    return tempCountryImg[search < 0 ? 0 : search];
  }

  onDownloadPdfPressed() async {
    var status = await Permission.storage.request();
    printInfo(info: status.toString());
    if (status == PermissionStatus.granted) {
      CommonFunction.loadingShow();
      final baseUrl = dotenv.env['APP_ENV'] == 'dev' ? dotenv.env['BASE_URL_PDF_DEV'] : dotenv.env['BASE_URL_PDF_PROD'];

      var uri = '$baseUrl${helperDetail.value.id}${EndpointConstant.HELPERS_PDF}';

      String pathDownload = "${await getDownloadPath()}/${DateTime.now().millisecondsSinceEpoch}.pdf";
      printInfo(info: "Path : $pathDownload");
      printInfo(info: "uri : $uri");

      if (pathDownload.isNotEmpty) {
        Dio dio = Dio();

        try {
          var respon = await dio.download(
            uri,
            pathDownload,
            onReceiveProgress: (rcv, total) {
              printInfo(info: 'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');
            },
          );
          printInfo(info: "Res : ${respon.statusMessage}");
          CommonFunction.loadingHide();
          CommonFunction.snackbarHelper(
            message: "${'download_file_msg'.tr} $pathDownload",
            isSuccess: true,
            duration: Duration(seconds: 10),
            mainButtonOnPressed: () {
              Get.to(
                () => DocumentPreviewView(pdfPath: pathDownload),
              );
            },
            mainButton: Text(
              'view_doc'.tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: AppConstant.SF_PRO_FONT,
              ),
            ),
          );
        } on DioError catch (e) {
          CommonFunction.loadingHide();
          CommonFunction.snackbarHelper(message: "download_file_error_msg_2".tr, isSuccess: false);
          printError(info: "Error : ${e.response?.statusCode}");
        } catch (e) {
          printError(info: "Error : $e");
        }
      } else {
        CommonFunction.loadingHide();
        CommonFunction.snackbarHelper(message: "download_file_error_msg".tr, isSuccess: false);
      }
    } else if (status == PermissionStatus.denied) {
      CommonFunction.snackbarHelper(message: "error_permission_storage".tr, isSuccess: false);
    } else {
      CommonFunction.snackbarHelper(message: "error_permission_storage".tr, isSuccess: false);
      await openAppSettings();
    }
  }

  Future<String> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = (await getExternalStorageDirectories(type: StorageDirectory.downloads))?.first;
      }
    } catch (err) {
      print("Cannot get download folder path : ${err.toString()}");
    }
    if (directory != null) {
      return directory.path;
    }
    return "";
  }

  onScheduleInterviewPressed() {
    Get.toNamed(Routes.SCHEDULE_INTERVIEW, arguments: {'helper': helperDetail.value});
  }
}
