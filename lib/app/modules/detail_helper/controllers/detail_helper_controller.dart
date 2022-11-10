// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class DetailHelperController extends GetxController {
  RxDouble count = 0.0.obs;

  RxList languageSkills = [
    {
      "rating": 5.0,
      "label": "Bahasa",
    },
    {
      "rating": 2.0,
      "label": "English",
    },
    {
      "rating": 2.0,
      "label": "Chinese",
    },
  ].obs;

  RxList workSkills = [
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
  ].obs;

  RxList willing = [
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

  RxList workExperience = [
    {
      "year": "2018 - 2019",
      "label": "Saudi Arabia",
    },
    {
      "year": "2016 - 2017",
      "label": "Australia",
    },
    {
      "year": "2013 - 2015",
      "label": "Singapore",
    },
  ].obs;

  RxList vaccination = [
    {
      "step": "3rd Dose - Booster",
      "label": "27 February 2021",
      "type": "Sinovac",
    },
    {
      "step": "2nd Dose",
      "label": "15 October 2020",
      "type": "Sinovac",
    },
    {
      "step": "1st Dose",
      "label": "10 March 2020",
      "type": "Sinovac",
    },
  ].obs;

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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateCount(value) {
    count.value = value;
    printInfo(info: count.toString());
  }
}
