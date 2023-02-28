// ignore_for_file: unnecessary_overrides

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/entity/helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_country_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_education_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_language_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_marital_status_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_nationality_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_religion_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_sort_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_status_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_work_experience_helpers_model.dart';
import 'package:maiden_employer/app/models/entity/option_work_skill_helpers_model.dart';
import 'package:maiden_employer/app/models/response_education_levels.dart';
import 'package:maiden_employer/app/models/response_helpers.dart';
import 'package:maiden_employer/app/models/response_helpers_count.dart';
import 'package:maiden_employer/app/models/response_languages.dart';
import 'package:maiden_employer/app/models/response_marital_status.dart';
import 'package:maiden_employer/app/models/response_nationalities.dart';
import 'package:maiden_employer/app/models/response_skills.dart';
import 'package:maiden_employer/app/models/response_work_experiences.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HelperListingController extends GetxController {
  RefreshController refreshCt = RefreshController();
  RxInt page = 1.obs;
  RxInt totalData = 0.obs;
  TextEditingController inputSearch = TextEditingController();
  var isLoading = true.obs;
  var helpers = <HelpersModel>[].obs;
  var helpersCountSearch = 1.obs;

  var helpersCountry = <OptionCountryHelpersModel>[].obs;
  RxString helpersCountrySelected = "".obs;

  var months = <OptionMonth>[].obs;
  var selectedMonth = OptionMonth().obs;

  var year = <OptionYear>[].obs;
  var selectedYear = OptionYear().obs;
  var now = DateTime.now();
  var isMonthYearFiltered = false.obs;

  Rx<RangeValues> currentRangeValues = RangeValues(15, 80).obs;
  TextEditingController inputAgeEnd = TextEditingController();
  TextEditingController inputAgeStart = TextEditingController();
  var isAgeFiltered = false.obs;

  ExpandableController skillsIsExpanded = ExpandableController(initialExpanded: true);
  ExpandableController readyIsExpanded = ExpandableController(initialExpanded: false);
  ExpandableController ageIsExpanded = ExpandableController(initialExpanded: false);

  var helpersSortBy = <OptionSortHelpersModel>[].obs;
  var selectedSortBy = OptionSortHelpersModel().obs;
  var selectedSortByTemp = OptionSortHelpersModel().obs;

  var helpersStatus = <OptionStatusHelpersModel>[].obs;
  var helpersStatusSelected = OptionStatusHelpersModel().obs;

  var helpersNationality = <OptionNasionalityHelpersModel>[].obs;
  var helpersNationalitySelected = <OptionNasionalityHelpersModel>[].obs;
  RxBool isAllNationalitySelected = false.obs;

  var helpersLanguage = <OptionLanguageHelpersModel>[].obs;
  var helpersLanguageSelected = <OptionLanguageHelpersModel>[].obs;
  RxBool isAllLanguageSelected = false.obs;

  var helpersReligion = <OptionReligionHelpersModel>[].obs;
  var helpersReligionSelected = <OptionReligionHelpersModel>[].obs;
  RxBool isAllReligionSelected = false.obs;

  var helpersEducation = <OptionEducationHelpersModel>[].obs;
  var helpersEducationSelected = <OptionEducationHelpersModel>[].obs;
  RxBool isAllEducationSelected = false.obs;

  var helpersMaritalStatus = <OptionMaritalStatusHelpersModel>[].obs;
  var helpersMaritalStatusSelected = <OptionMaritalStatusHelpersModel>[].obs;
  RxBool isAllMaritalStatusSelected = false.obs;

  var helperSkillsTextCt = TextEditingController();
  var helpersWorkSkill = <OptionWorkSkillHelpersModel>[].obs;
  var helpersWorkSkillSelected = <OptionWorkSkillHelpersModel>[].obs;
  RxBool isAllWorkSkillSelected = false.obs;

  var helpersWorkExperience = <OptionWorkExperienceHelpersModel>[].obs;
  var helpersWorkExperienceSelected = <OptionWorkExperienceHelpersModel>[].obs;
  RxBool isAllWorkExperienceSelected = false.obs;

  RxBool isFiltered = false.obs;

  @override
  void onInit() {
    super.onInit();
    inputAgeStart.value = TextEditingValue(text: "15");
    inputAgeEnd.value = TextEditingValue(text: "80");

    helpersCountSearch.value = 0;
    months.assignAll([
      OptionMonth(label: "Jan", value: "01"),
      OptionMonth(label: "Feb", value: "02"),
      OptionMonth(label: "Mar", value: "03"),
      OptionMonth(label: "Apr", value: "04"),
      OptionMonth(label: "May", value: "05"),
      OptionMonth(label: "Jun", value: "06"),
      OptionMonth(label: "Jul", value: "07"),
      OptionMonth(label: "Aug", value: "08"),
      OptionMonth(label: "Sep", value: "09"),
      OptionMonth(label: "Nov", value: "11"),
      OptionMonth(label: "Dec", value: "12"),
    ]);
    selectedMonth.value = months[0];

    for (var i = 0; i <= 5; i++) {
      year.add(OptionYear(
        value: "${now.year + i}",
        label: "${now.year + i}",
      ));
    }
    selectedYear.value = year[0];

    getHelpers();

    getHelpersCount();

    helpersSortBy.assignAll([
      OptionSortHelpersModel(
        label: "filters_sort_by_experience_desc".tr,
        value: '1',
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_experience_asc".tr,
        value: '2',
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_salary_desc".tr,
        value: '3',
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_salary_asc".tr,
        value: '4',
      ),
    ]);
    selectedSortBy.value = helpersSortBy[0];
    selectedSortByTemp.value = helpersSortBy[0];

    helpersStatus.assignAll([
      OptionStatusHelpersModel(
        label: "filters_in_singapore".tr,
        value: 'SG',
      ),
      OptionStatusHelpersModel(
        label: "filters_overseas".tr,
        value: 'OVERSEAS',
      ),
    ]);

    // helpersStatusSelected.value = OptionStatusHelpersModel(
    //   label: "filters_in_singapore".tr,
    //   value: 'SG',
    //   selected: true,
    // );

    getNationalities();

    getLanguages();

    getReligions();

    getEducations();

    getMaritalStatus();

    getSkills();

    getWorkExperiences();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getSkills() {
    var temp = [
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_infant_care".tr,
        value: "filters_work_skills_infant_care".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_child_care".tr,
        value: "filters_work_skills_child_care".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_elderly_care".tr,
        value: "filters_work_skills_elderly_care".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_disabled_special_needs_care".tr,
        value: "filters_work_skills_disabled_special_needs_care".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_general_housekeeping".tr,
        value: "filters_work_skills_general_housekeeping".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_laundry".tr,
        value: "filters_work_skills_laundry".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_cooking".tr,
        value: "filters_work_skills_cooking".tr,
      ),
      OptionWorkSkillHelpersModel(
        label: "filters_work_skills_pet_care".tr,
        value: "filters_work_skills_pet_care".tr,
      ),
    ];

    ApiRepositories.skills().then((value) {
      if (value is ResponseSkills) {
        helpersWorkSkill
            .assignAll(value.data!.list!.map((e) => OptionWorkSkillHelpersModel(label: e.label, value: e.value)));
      } else {
        helpersWorkSkill.assignAll(temp);
      }
    }, onError: (e) {
      helpersWorkSkill.assignAll(temp);
    });
  }

  getNationalities() {
    var tempCountry = [
      OptionCountryHelpersModel(label: "all".tr, value: "all"),
    ];

    var temp = [
      OptionNasionalityHelpersModel(
        label: "filters_nationality_id".tr,
        value: "filters_nationality_id".tr,
        pathImg: "assets/images/icon-country-indonesia.svg",
      ),
      OptionNasionalityHelpersModel(
        label: "filters_nationality_ph".tr,
        value: "filters_nationality_ph".tr,
        pathImg: "assets/images/icon-country-philippines.svg",
      ),
      OptionNasionalityHelpersModel(
        label: "filters_nationality_mm".tr,
        value: "filters_nationality_mm".tr,
        pathImg: "assets/images/icon-country-myanmar.svg",
      ),
      OptionNasionalityHelpersModel(
        label: "filters_nationality_in".tr,
        value: "filters_nationality_in".tr,
        pathImg: "assets/images/icon-country-indian.svg",
      ),
      OptionNasionalityHelpersModel(
        label: "filters_nationality_lk".tr,
        value: "filters_nationality_lk".tr,
        pathImg: "assets/images/icon-country-sri-lanka.svg",
      ),
    ];

    ApiRepositories.nationalities().then((value) {
      if (value is ResponseNationalities) {
        helpersNationality.assignAll(value.data!.list!.map((e) {
          var icon = 'assets/images/icon-country-indonesia.svg';
          if (e.value!.toLowerCase().contains('filippino')) {
            icon = 'assets/images/icon-country-philippines.svg';
          } else if (e.value!.toLowerCase().contains('burmese')) {
            icon = 'assets/images/icon-country-myanmar.svg';
          } else if (e.value!.toLowerCase().contains('indian')) {
            icon = 'assets/images/icon-country-indian.svg';
          } else if (e.value!.toLowerCase().contains('lankan')) {
            icon = 'assets/images/icon-country-sri-lanka.svg';
          }

          return OptionNasionalityHelpersModel(label: e.label, value: e.value, pathImg: icon);
        }));

        helpersCountry.assignAll(tempCountry);
        helpersCountry.addAll(value.data!.list!.map((e) {
          return OptionCountryHelpersModel(label: e.label, value: e.value);
        }));

        helpersCountrySelected.value = helpersCountry[0].value!;
      } else {
        helpersNationality.assignAll(temp);
        helpersCountry.assignAll(tempCountry);

        helpersCountrySelected.value = helpersCountry[0].value!;
      }
    }, onError: (e) {
      helpersNationality.assignAll(temp);
      helpersCountry.assignAll(tempCountry);

      helpersCountrySelected.value = helpersCountry[0].value!;
    });
  }

  getLanguages() {
    var temp = [
      OptionLanguageHelpersModel(
        label: "filters_language_en".tr,
        value: "filters_language_en".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_md".tr,
        value: "filters_language_md".tr,
      ),
    ];

    ApiRepositories.languages().then((value) {
      if (value is ResponseLanguages) {
        helpersLanguage.assignAll(value.data!.list!.map((e) {
          return OptionLanguageHelpersModel(label: e.label, value: e.value);
        }));
      } else {
        helpersLanguage.assignAll(temp);
      }
    }, onError: (e) {
      helpersLanguage.assignAll(temp);
    });
  }

  getReligions() {
    var temp = [
      OptionReligionHelpersModel(
        label: "filters_religion_ms".tr,
        value: "filters_religion_ms".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_cs".tr,
        value: "filters_religion_cs".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_ch".tr,
        value: "filters_religion_ch".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_bd".tr,
        value: "filters_religion_bd".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_hd".tr,
        value: "filters_religion_hd".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_cf".tr,
        value: "filters_religion_cf".tr,
      ),
      OptionReligionHelpersModel(
        label: "filters_religion_ot".tr,
        value: "filters_religion_ot".tr,
      ),
    ];

    ApiRepositories.religions().then((value) {
      if (value is ResponseLanguages) {
        helpersReligion.assignAll(value.data!.list!.map((e) {
          return OptionReligionHelpersModel(label: e.label, value: e.value);
        }));
      } else {
        helpersReligion.assignAll(temp);
      }
    }, onError: (e) {
      helpersReligion.assignAll(temp);
    });
  }

  getEducations() {
    var temp = [
      OptionEducationHelpersModel(
        label: "filters_education_es".tr,
        value: "filters_education_es".tr,
      ),
      OptionEducationHelpersModel(
        label: "filters_education_ss".tr,
        value: "filters_education_ss".tr,
      ),
      OptionEducationHelpersModel(
        label: "filters_education_hs".tr,
        value: "filters_education_hs".tr,
      ),
      OptionEducationHelpersModel(
        label: "filters_education_cd".tr,
        value: "filters_education_cd".tr,
      ),
      OptionEducationHelpersModel(
        label: "filters_education_pg".tr,
        value: "filters_education_pg".tr,
      ),
    ];

    ApiRepositories.educationLevels().then((value) {
      if (value is ResponseEducationLevels) {
        helpersEducation.assignAll(value.data!.list!.map((e) {
          return OptionEducationHelpersModel(label: e.label, value: e.value);
        }));
      } else {
        helpersEducation.assignAll(temp);
      }
    }, onError: (e) {
      helpersEducation.assignAll(temp);
    });
  }

  getMaritalStatus() {
    var temp = [
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_single".tr,
        value: "filters_marital_single".tr,
      ),
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_married".tr,
        value: "filters_marital_married".tr,
      ),
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_divorced".tr,
        value: "filters_marital_divorced".tr,
      ),
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_separated".tr,
        value: "filters_marital_separated".tr,
      ),
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_widowed".tr,
        value: "filters_marital_widowed".tr,
      ),
      OptionMaritalStatusHelpersModel(
        label: "filters_marital_single_parent".tr,
        value: "filters_marital_single_parent".tr,
      ),
    ];

    ApiRepositories.maritalStatus().then((value) {
      if (value is ResponseMaritalStatus) {
        helpersMaritalStatus.assignAll(value.data!.list!.map((e) {
          return OptionMaritalStatusHelpersModel(label: e.label, value: e.value);
        }));
      } else {
        helpersMaritalStatus.assignAll(temp);
      }
    }, onError: (e) {
      helpersMaritalStatus.assignAll(temp);
    });
  }

  getWorkExperiences() {
    var temp = [
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_home_country".tr,
        value: "filters_work_experience_home_country".tr,
      ),
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_malaysia".tr,
        value: "filters_work_experience_malaysia".tr,
      ),
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_singapore".tr,
        value: "filters_work_experience_singapore".tr,
      ),
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_hong_kong".tr,
        value: "filters_work_experience_hong_kong".tr,
      ),
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_taiwan".tr,
        value: "filters_work_experience_taiwan".tr,
      ),
      OptionWorkExperienceHelpersModel(
        label: "filters_work_experience_middle_east".tr,
        value: "filters_work_experience_middle_east".tr,
      ),
    ];

    ApiRepositories.workExperiences().then((value) {
      if (value is ResponseWorkExperiences) {
        helpersWorkExperience.assignAll(value.data!.list!.map((e) {
          return OptionWorkExperienceHelpersModel(label: e.label, value: e.value);
        }));
      } else {
        helpersWorkExperience.assignAll(temp);
      }
    }, onError: (e) {
      helpersWorkExperience.assignAll(temp);
    });
  }

  onSkillSearchRemoveSelected(String value) {
    for (var i = 0; i < helpersWorkSkill.length; i++) {
      if (helpersWorkSkill[i].value == value) {
        helpersWorkSkill[i].selected = false;
      }
    }

    helpersWorkSkillSelected.assignAll(helpersWorkSkill.where((p) => p.selected ?? false).toList());

    helpersWorkSkill.refresh();

    getHelpersCount();
  }

  onSkillSearchSelected(OptionWorkSkillHelpersModel suggestion) {
    for (var i = 0; i < helpersWorkSkill.length; i++) {
      if (helpersWorkSkill[i].value!.toLowerCase().contains(suggestion.value!.toLowerCase())) {
        helpersWorkSkill[i].selected = true;
      }
    }

    helpersWorkSkillSelected.assignAll(helpersWorkSkill.where((p) => p.selected ?? false).toList());

    helperSkillsTextCt.text = '';
    helpersWorkSkill.refresh();

    print('====> ${helpersWorkSkillSelected.toJson()}');
    getHelpersCount();
  }

  onSelectCountryFilter(int index) {
    helpersCountrySelected.value = helpersCountry[index].value!;
    helpersCountry.refresh();

    getHelpers();
  }

  onSelectReadyMonth(OptionMonth value) {
    selectedMonth.value = value;

    getHelpersCount();
  }

  onSelectReadyYear(OptionYear value) {
    selectedYear.value = value;

    getHelpersCount();
  }

  onSubmitAgeStart(String value) {
    double start = currentRangeValues.value.start;
    double end = currentRangeValues.value.end;
    if (value.isEmpty) {
      inputAgeStart.value = TextEditingValue(text: start.toStringAsFixed(0));
    } else {
      double newStart = double.parse(value);
      if (newStart < 15) {
        inputAgeStart.value = TextEditingValue(text: "15");
        newStart = 15;
      } else if (newStart >= end) {
        inputAgeStart.value = TextEditingValue(text: start.toStringAsFixed(0));
        newStart = start;
      }
      currentRangeValues.value = RangeValues(newStart, end);
    }
  }

  onSubmitAgeEnd(String value) {
    double start = currentRangeValues.value.start;
    double end = currentRangeValues.value.end;
    if (value.isEmpty) {
      inputAgeEnd.value = TextEditingValue(text: end.toStringAsFixed(0));
    } else {
      double newEnd = double.parse(value);
      if (newEnd > 80) {
        inputAgeEnd.value = TextEditingValue(text: "80");
        newEnd = 80;
      } else if (newEnd <= start) {
        inputAgeEnd.value = TextEditingValue(text: end.toStringAsFixed(0));
        newEnd = end;
      }
      currentRangeValues.value = RangeValues(start, newEnd);
    }
  }

  onChangeRangeAge(RangeValues values) {
    isAgeFiltered.value = true;
    currentRangeValues.value = values;
    inputAgeStart.value = TextEditingValue(text: values.start.toStringAsFixed(0));
    inputAgeEnd.value = TextEditingValue(text: values.end.toStringAsFixed(0));
    getHelpersCount();
  }

  onChangeIsExpanded(int index) {
    switch (index) {
      case 0:
        skillsIsExpanded.value = true;
        readyIsExpanded.value = false;
        ageIsExpanded.value = false;
        break;

      case 1:
        skillsIsExpanded.value = false;
        readyIsExpanded.value = true;
        ageIsExpanded.value = false;
        break;

      case 2:
        skillsIsExpanded.value = false;
        readyIsExpanded.value = false;
        ageIsExpanded.value = true;
        break;
      default:
    }
  }

  onSubmitSearch() {
    int emptyCount = 0;
    if (helpersWorkSkill.where((p) => p.selected ?? false).toList().isEmpty) emptyCount += 1;
    if (!isMonthYearFiltered.value) emptyCount += 1;
    if (!isAgeFiltered.value) emptyCount += 1;

    if (emptyCount > 2) {
      CommonFunction.snackbarHelper(
          isSuccess: false, title: 'Warning', message: 'please at least select one of the search conditions');
    } else {
      Get.back();
      isFiltered.value = true;

      getHelpersCount();
      getHelpers();
    }
  }

  onClearSearch() {
    isFiltered.value = false;

    for (var i = 0; i < helpersWorkSkill.length; i++) {
      helpersWorkSkill[i].selected = false;
    }

    selectedMonth.value = months[0];
    selectedYear.value = year[0];
    isMonthYearFiltered.value = false;

    currentRangeValues.value = RangeValues(15, 80);
    inputAgeStart.value = TextEditingValue(text: "15");
    inputAgeEnd.value = TextEditingValue(text: "80");
    isAgeFiltered.value = false;

    selectedSortBy.value = helpersSortBy[0];
    selectedSortByTemp.value = helpersSortBy[0];

    helpersStatus.assignAll([
      OptionStatusHelpersModel(
        label: "filters_in_singapore".tr,
        value: 'SG',
      ),
      OptionStatusHelpersModel(
        label: "filters_overseas".tr,
        value: 'OVERSEAS',
      ),
    ]);

    helpersStatusSelected.value = OptionStatusHelpersModel();

    helpersCountrySelected.value = 'all';

    helpersNationalitySelected.clear();
    for (var i = 0; i < helpersNationality.length; i++) {
      helpersNationality[i].selected = false;
    }

    helpersLanguageSelected.clear();
    for (var i = 0; i < helpersLanguage.length; i++) {
      helpersLanguage[i].selected = false;
    }

    helpersReligionSelected.clear();
    for (var i = 0; i < helpersReligion.length; i++) {
      helpersReligion[i].selected = false;
    }

    helpersEducationSelected.clear();
    for (var i = 0; i < helpersEducation.length; i++) {
      helpersEducation[i].selected = false;
    }

    helpersMaritalStatusSelected.clear();
    for (var i = 0; i < helpersMaritalStatus.length; i++) {
      helpersMaritalStatus[i].selected = false;
    }

    helpersWorkSkillSelected.clear();
    for (var i = 0; i < helpersWorkSkill.length; i++) {
      helpersWorkSkill[i].selected = false;
    }

    helpersWorkExperienceSelected.clear();
    for (var i = 0; i < helpersWorkExperience.length; i++) {
      helpersWorkExperience[i].selected = false;
    }

    getHelpersCount();

    getHelpers();
  }

  onSelectSortBy(int index) {
    selectedSortByTemp.value = helpersSortBy[index];
    helpersSortBy.refresh();
  }

  onSetSortBy(bool isApply) {
    if (isApply) {
      selectedSortBy.value = selectedSortByTemp.value;
    } else {
      selectedSortByTemp.value = selectedSortBy.value;
    }

    getHelpersCount();
  }

  onSelectStatusFilter(int index) {
    if (helpersStatus[index].selected ?? false) {
      helpersStatusSelected.value = OptionStatusHelpersModel();
    } else {
      helpersStatusSelected.value = helpersStatus[index];
    }
    helpersStatus[index].selected = !helpersStatus[index].selected!;
    helpersStatus.refresh();

    getHelpersCount();
  }

  onSelectNationality(int index) {
    helpersNationality[index].selected = !helpersNationality[index].selected!;
    int countSelect = 0;
    for (OptionNasionalityHelpersModel e in helpersNationality) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersNationality.length) {
      isAllNationalitySelected.value = true;
    } else {
      isAllNationalitySelected.value = false;
    }
    helpersNationality.refresh();
  }

  onSetNationality(bool isApply, bool isAll) {
    if (isApply) {
      helpersNationalitySelected.clear();
      if (!isAllNationalitySelected.value) {
        for (var item in helpersNationality) {
          if (item.selected!) {
            helpersNationalitySelected.add(item);
          }
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllNationalitySelected.value = !isAllNationalitySelected.value;
        for (var item in helpersNationality) {
          item.selected = isAllNationalitySelected.value;
        }
        helpersNationality.refresh();
      } else {
        for (var element in helpersNationality) {
          element.selected = false;
        }
        for (var element in helpersNationalitySelected) {
          final index = helpersNationality.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersNationality[index].selected = true;
          }
        }
        if (helpersNationalitySelected.length == helpersNationality.length) {
          isAllNationalitySelected.value = true;
        } else {
          isAllNationalitySelected.value = false;
        }
      }
    }
  }

  onSelectLanguage(int index) {
    helpersLanguage[index].selected = !helpersLanguage[index].selected!;
    int countSelect = 0;
    for (var e in helpersLanguage) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersLanguage.length) {
      isAllLanguageSelected.value = true;
    } else {
      isAllLanguageSelected.value = false;
    }
    helpersLanguage.refresh();
  }

  onSetLanguage(bool isApply, bool isAll) {
    if (isApply) {
      helpersLanguageSelected.clear();
      for (var item in helpersLanguage) {
        if (item.selected!) {
          helpersLanguageSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllLanguageSelected.value = !isAllLanguageSelected.value;
        for (var item in helpersLanguage) {
          item.selected = isAllLanguageSelected.value;
        }
        helpersLanguage.refresh();
      } else {
        for (var element in helpersLanguage) {
          element.selected = false;
        }
        for (var element in helpersLanguageSelected) {
          final index = helpersLanguage.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersLanguage[index].selected = true;
          }
        }
        if (helpersLanguageSelected.length == helpersLanguage.length) {
          isAllLanguageSelected.value = true;
        } else {
          isAllLanguageSelected.value = false;
        }
      }
    }
  }

  onSelectReligion(int index) {
    helpersReligion[index].selected = !helpersReligion[index].selected!;
    int countSelect = 0;
    for (var e in helpersReligion) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersReligion.length) {
      isAllReligionSelected.value = true;
    } else {
      isAllReligionSelected.value = false;
    }
    helpersReligion.refresh();
  }

  onSetReligion(bool isApply, bool isAll) {
    if (isApply) {
      helpersReligionSelected.clear();
      for (var item in helpersReligion) {
        if (item.selected!) {
          helpersReligionSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllReligionSelected.value = !isAllReligionSelected.value;
        for (var item in helpersReligion) {
          item.selected = isAllReligionSelected.value;
        }
        helpersReligion.refresh();
      } else {
        for (var element in helpersReligion) {
          element.selected = false;
        }
        for (var element in helpersReligionSelected) {
          final index = helpersReligion.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersReligion[index].selected = true;
          }
        }
        if (helpersReligionSelected.length == helpersReligion.length) {
          isAllReligionSelected.value = true;
        } else {
          isAllReligionSelected.value = false;
        }
      }
    }
  }

  onSelectEducation(int index) {
    helpersEducation[index].selected = !helpersEducation[index].selected!;
    int countSelect = 0;
    for (var e in helpersEducation) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersEducation.length) {
      isAllEducationSelected.value = true;
    } else {
      isAllEducationSelected.value = false;
    }
    helpersEducation.refresh();
  }

  onSetEducation(bool isApply, bool isAll) {
    if (isApply) {
      helpersEducationSelected.clear();
      for (var item in helpersEducation) {
        if (item.selected!) {
          helpersEducationSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllEducationSelected.value = !isAllEducationSelected.value;
        for (var item in helpersEducation) {
          item.selected = isAllEducationSelected.value;
        }
        helpersEducation.refresh();
      } else {
        for (var element in helpersEducation) {
          element.selected = false;
        }
        for (var element in helpersEducationSelected) {
          final index = helpersEducation.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersEducation[index].selected = true;
          }
        }
        if (helpersEducationSelected.length == helpersEducation.length) {
          isAllEducationSelected.value = true;
        } else {
          isAllEducationSelected.value = false;
        }
      }
    }
  }

  onSelectMaritalStatus(int index) {
    helpersMaritalStatus[index].selected = !helpersMaritalStatus[index].selected!;
    int countSelect = 0;
    for (var e in helpersMaritalStatus) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersMaritalStatus.length) {
      isAllMaritalStatusSelected.value = true;
    } else {
      isAllMaritalStatusSelected.value = false;
    }
    helpersMaritalStatus.refresh();
  }

  onSetMaritalStatus(bool isApply, bool isAll) {
    if (isApply) {
      helpersMaritalStatusSelected.clear();
      for (var item in helpersMaritalStatus) {
        if (item.selected!) {
          helpersMaritalStatusSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllMaritalStatusSelected.value = !isAllMaritalStatusSelected.value;
        for (var item in helpersMaritalStatus) {
          item.selected = isAllMaritalStatusSelected.value;
        }
        helpersMaritalStatus.refresh();
      } else {
        for (var element in helpersMaritalStatus) {
          element.selected = false;
        }
        for (var element in helpersMaritalStatusSelected) {
          final index = helpersMaritalStatus.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersMaritalStatus[index].selected = true;
          }
        }
        if (helpersMaritalStatusSelected.length == helpersMaritalStatus.length) {
          isAllMaritalStatusSelected.value = true;
        } else {
          isAllMaritalStatusSelected.value = false;
        }
      }
    }
  }

  onSelectWorkSkill(int index) {
    helpersWorkSkill[index].selected = !helpersWorkSkill[index].selected!;
    int countSelect = 0;
    for (var e in helpersWorkSkill) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersWorkSkill.length) {
      isAllWorkSkillSelected.value = true;
    } else {
      isAllWorkSkillSelected.value = false;
    }
    helpersWorkSkill.refresh();
  }

  onSetWorkSkill(bool isApply, bool isAll) {
    if (isApply) {
      helpersWorkSkillSelected.clear();
      for (var item in helpersWorkSkill) {
        if (item.selected!) {
          helpersWorkSkillSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllWorkSkillSelected.value = !isAllWorkSkillSelected.value;
        for (var item in helpersWorkSkill) {
          item.selected = isAllWorkSkillSelected.value;
        }
        helpersWorkSkill.refresh();
      } else {
        for (var element in helpersWorkSkill) {
          element.selected = false;
        }
        for (var element in helpersWorkSkillSelected) {
          final index = helpersWorkSkill.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersWorkSkill[index].selected = true;
          }
        }
        if (helpersWorkSkillSelected.length == helpersWorkSkill.length) {
          isAllWorkSkillSelected.value = true;
        } else {
          isAllWorkSkillSelected.value = false;
        }
      }
    }
  }

  onSelectWorkExperience(int index) {
    helpersWorkExperience[index].selected = !helpersWorkExperience[index].selected!;
    int countSelect = 0;
    for (var e in helpersWorkExperience) {
      if (e.selected!) {
        countSelect++;
      }
    }
    if (countSelect == helpersWorkExperience.length) {
      isAllWorkExperienceSelected.value = true;
    } else {
      isAllWorkExperienceSelected.value = false;
    }
    helpersWorkExperience.refresh();
  }

  onSetWorkExperience(bool isApply, bool isAll) {
    if (isApply) {
      helpersWorkExperienceSelected.clear();
      for (var item in helpersWorkExperience) {
        if (item.selected!) {
          helpersWorkExperienceSelected.add(item);
        }
      }

      getHelpersCount();
    } else {
      if (isAll) {
        isAllWorkExperienceSelected.value = !isAllWorkExperienceSelected.value;
        for (var item in helpersWorkExperience) {
          item.selected = isAllWorkExperienceSelected.value;
        }
        helpersWorkExperience.refresh();
      } else {
        for (var element in helpersWorkExperience) {
          element.selected = false;
        }
        for (var element in helpersWorkExperienceSelected) {
          final index = helpersWorkExperience.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersWorkExperience[index].selected = true;
          }
        }
        if (helpersWorkExperienceSelected.length == helpersWorkExperience.length) {
          isAllWorkExperienceSelected.value = true;
        } else {
          isAllWorkExperienceSelected.value = false;
        }
      }
    }
  }

  String helperCountryImage({required String country}) {
    print('===? $country');
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

    var search = tempCountry.indexWhere((e) => e.contains(country.toLowerCase()));

    return tempCountryImg[search < 0 ? 0 : search];
  }

  getHelpers() {
    isLoading.value = true;
    helpers.clear();
    page.value = 1;
    hitApi();
  }

  hitApi() {
    ApiRepositories.helperList(
      page: page.value,
      ageMin: isAgeFiltered.value ? currentRangeValues.value.start.toInt() : null,
      ageMax: isAgeFiltered.value ? currentRangeValues.value.end.toInt() : null,
      status: helpersStatusSelected.value.value,
      nationality: !isFiltered.value
          ? helpersCountrySelected.value == 'all'
              ? null
              : helpersCountrySelected.value
          : helpersNationalitySelected.isEmpty
              ? null
              : helpersNationalitySelected.map((e) => e.value).toList().join(','),
      religion: helpersReligionSelected.isEmpty ? null : helpersReligionSelected.map((e) => e.value).toList().join(','),
      skills:
          helpersWorkSkillSelected.isEmpty ? null : helpersWorkSkillSelected.map((e) => e.value!).toList().join(','),
      language: helpersLanguageSelected.isEmpty ? null : helpersLanguageSelected.map((e) => e.value).toList().join(','),
      education:
          helpersEducationSelected.isEmpty ? null : helpersEducationSelected.map((e) => e.value).toList().join(','),
      maritalStatus: helpersMaritalStatusSelected.isEmpty
          ? null
          : helpersMaritalStatusSelected.map((e) => e.value).toList().join(','),
      readyFromMin: isFiltered.value && isMonthYearFiltered.value
          ? '${selectedYear.value.value}-${selectedMonth.value.value}-01'
          : null,
      orderBy: selectedSortBy.value.value,
      workExperience: helpersWorkExperienceSelected.isEmpty
          ? null
          : helpersWorkExperienceSelected.map((e) => e.value).toList().join(','),
    ).then((value) {
      isLoading.value = false;
      refreshCt.refreshCompleted();
      refreshCt.loadComplete();
      if (value is ResponseHelpers) {
        totalData.value = value.data?.totalData ?? 0;
        helpers.addAll(value.data!.list!.map(
          (e) => HelpersModel(
            id: e.id,
            image: e.photo != null && e.photo!.isNotEmpty
                ? '${e.photo}'.replaceAll('public/', '')
                : AppConstant.DEFAULT_AVATAR,
            age: int.tryParse(e.age ?? '0'),
            country: e.country,
            experience: int.tryParse(e.experienceYears ?? '0'),
            name: e.fullName,
            readyDate: (e.readyForHireDate?.isEmpty ?? true) ? null : DateTime.parse(e.readyForHireDate!),
          ),
        ));
      } else {
        CommonFunction.snackbarHelper(isSuccess: false, message: value!.message!);
      }
    }, onError: (e) {
      CommonFunction.snackbarHelper(isSuccess: false, message: e.toString());
      isLoading.value = false;
      printInfo(info: e.toString());
    });
  }

  getHelpersCount() {
    helpersCountSearch.value = 0;
    ApiRepositories.helperCount(
      ageMin: isAgeFiltered.value ? currentRangeValues.value.start.toInt() : null,
      ageMax: isAgeFiltered.value ? currentRangeValues.value.end.toInt() : null,
      status: helpersStatusSelected.value.value,
      nationality: !isFiltered.value
          ? helpersCountrySelected.value == 'all'
              ? null
              : helpersCountrySelected.value
          : helpersNationalitySelected.isEmpty
              ? null
              : helpersNationalitySelected.map((e) => e.value).toList().join(','),
      religion: helpersReligionSelected.isEmpty ? null : helpersReligionSelected.map((e) => e.value).toList().join(','),
      skills:
          helpersWorkSkillSelected.isEmpty ? null : helpersWorkSkillSelected.map((e) => e.value!).toList().join(','),
      language: helpersLanguageSelected.isEmpty ? null : helpersLanguageSelected.map((e) => e.value).toList().join(','),
      education:
          helpersEducationSelected.isEmpty ? null : helpersEducationSelected.map((e) => e.value).toList().join(','),
      maritalStatus: helpersMaritalStatusSelected.isEmpty
          ? null
          : helpersMaritalStatusSelected.map((e) => e.value).toList().join(','),
      readyFromMin: isMonthYearFiltered.value ? '${selectedYear.value.value}-${selectedMonth.value.value}-01' : null,
      orderBy: selectedSortBy.value.value,
      workExperience: helpersWorkExperienceSelected.isEmpty
          ? null
          : helpersWorkExperienceSelected.map((e) => e.value).toList().join(','),
    ).then((value) {
      if (value is ResponseHelpersCount) {
        helpersCountSearch.value = value.data?.totalData ?? 0;
      } else {}
    }, onError: (e) {});
  }

  onRefresh() async {
    isLoading.value = true;
    page.value = 1;
    getHelpers();
  }

  onLoadingMore() async {
    page.value++;
    hitApi();
  }
}
