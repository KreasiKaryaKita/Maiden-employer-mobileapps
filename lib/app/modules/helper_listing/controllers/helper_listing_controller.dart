// ignore_for_file: unnecessary_overrides

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
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
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_year.dart';

class HelperListingController extends GetxController {
  TextEditingController inputSearch = TextEditingController();
  var helpers = <HelpersModel>[].obs;
  var helpersCountry = <OptionCountryHelpersModel>[].obs;
  RxString helpersCountrySelected = "".obs;

  var months = <OptionMonth>[].obs;
  var selectedMonth = OptionMonth().obs;

  var year = <OptionYear>[].obs;
  var selectedYear = OptionYear().obs;
  var now = DateTime.now();

  Rx<RangeValues> currentRangeValues = RangeValues(21, 50).obs;

  ExpandableController skillsIsExpanded = ExpandableController(initialExpanded: true);
  ExpandableController readyIsExpanded = ExpandableController(initialExpanded: false);
  ExpandableController ageIsExpanded = ExpandableController(initialExpanded: false);

  var helpersSortBy = <OptionSortHelpersModel>[].obs;
  var selectedSortBy = OptionSortHelpersModel().obs;
  var selectedSortByTemp = OptionSortHelpersModel().obs;
  var helpersStatus = <OptionStatusHelpersModel>[].obs;
  var helpersStatusSelected = <OptionStatusHelpersModel>[].obs;
  var helpersNationality = <OptionNasionalityHelpersModel>[].obs;
  var helpersNationalitySelected = <OptionNasionalityHelpersModel>[].obs;

  var helpersLanguage = <OptionLanguageHelpersModel>[].obs;
  var helpersLanguageSelected = <OptionLanguageHelpersModel>[].obs;

  var helpersReligion = <OptionReligionHelpersModel>[].obs;
  var helpersReligionSelected = <OptionReligionHelpersModel>[].obs;

  var helpersEducation = <OptionEducationHelpersModel>[].obs;
  var helpersEducationSelected = <OptionEducationHelpersModel>[].obs;

  var helpersMaritalStatus = <OptionMaritalStatusHelpersModel>[].obs;
  var helpersMaritalStatusSelected = <OptionMaritalStatusHelpersModel>[].obs;

  var helpersWorkSkill = <OptionWorkSkillHelpersModel>[].obs;
  var helpersWorkSkillSelected = <OptionWorkSkillHelpersModel>[].obs;

  var helpersWorkExperience = <OptionWorkExperienceHelpersModel>[].obs;
  var helpersWorkExperienceSelected = <OptionWorkExperienceHelpersModel>[].obs;

  RxBool isFiltered = false.obs;

  @override
  void onInit() {
    super.onInit();
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

    helpers.assignAll(
      [
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 28,
          country: "indonesia",
          experience: 3,
          name: "Susilawati Riandy",
          readyDate: DateTime.parse("2022-11-25"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 22,
          country: "indonesia",
          experience: 2,
          name: "Maryani Frida",
          readyDate: DateTime.parse("2022-11-28"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "singapore",
          experience: 5,
          name: "Herlina Gustiana",
          readyDate: DateTime.parse("2022-11-29"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "myanmar",
          experience: 5,
          name: "Geovani Ega",
          readyDate: DateTime.parse("2022-11-29"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "indian",
          experience: 5,
          name: "Fery Rahmad",
          readyDate: DateTime.parse("2022-11-29"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "philippines",
          experience: 5,
          name: "Fatah Kumara",
          readyDate: DateTime.parse("2022-11-29"),
        ),
        HelpersModel(
          image: AppConstant.DEFAULT_AVATAR,
          age: 25,
          country: "sri-lanka",
          experience: 5,
          name: "Bruno Fandi",
          readyDate: DateTime.parse("2022-11-29"),
        ),
      ],
    );

    helpersCountry.assignAll([
      OptionCountryHelpersModel(label: "all".tr, value: "all"),
      OptionCountryHelpersModel(label: "Indonesian".tr, value: "Indonesian"),
      OptionCountryHelpersModel(label: "Phillippines".tr, value: "Phillippines"),
      OptionCountryHelpersModel(label: "Myanmar".tr, value: "Myanmar"),
    ]);
    helpersCountrySelected.value = helpersCountry[0].value!;

    helpersSortBy.assignAll([
      OptionSortHelpersModel(
        label: "filters_sort_by_experience_desc".tr,
        value: "filters_sort_by_experience_desc".tr,
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_experience_asc".tr,
        value: "filters_sort_by_experience_asc".tr,
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_salary_desc".tr,
        value: "filters_sort_by_salary_desc".tr,
      ),
      OptionSortHelpersModel(
        label: "filters_sort_by_salary_asc".tr,
        value: "filters_sort_by_salary_asc".tr,
      ),
    ]);
    selectedSortBy.value = helpersSortBy[0];
    selectedSortByTemp.value = helpersSortBy[0];

    helpersStatus.assignAll([
      OptionStatusHelpersModel(
        label: "filters_in_singapore".tr,
        value: "filters_in_singapore".tr,
        selected: true,
      ),
      OptionStatusHelpersModel(
        label: "filters_overseas".tr,
        value: "filters_overseas".tr,
        selected: true,
      ),
    ]);
    helpersStatusSelected.assignAll([
      OptionStatusHelpersModel(
        label: "filters_in_singapore".tr,
        value: "filters_in_singapore".tr,
        selected: true,
      ),
      OptionStatusHelpersModel(
        label: "filters_overseas".tr,
        value: "filters_overseas".tr,
        selected: true,
      ),
    ]);

    helpersNationality.assignAll([
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
    ]);

    helpersLanguage.assignAll([
      OptionLanguageHelpersModel(
        label: "filters_language_en".tr,
        value: "filters_language_en".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_md".tr,
        value: "filters_language_md".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_ml".tr,
        value: "filters_language_ml".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_hk".tr,
        value: "filters_language_hk".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_ct".tr,
        value: "filters_language_ct".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_hd".tr,
        value: "filters_language_hd".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_tm".tr,
        value: "filters_language_tm".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_tc".tr,
        value: "filters_language_tc".tr,
      ),
      OptionLanguageHelpersModel(
        label: "filters_language_hkk".tr,
        value: "filters_language_hkk".tr,
      ),
    ]);

    helpersReligion.assignAll([
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
    ]);

    helpersEducation.assignAll([
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
    ]);

    helpersMaritalStatus.assignAll([
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
    ]);

    helpersWorkSkill.assignAll([
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
    ]);

    helpersWorkExperience.assignAll([
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
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelectCountryFilter(int index) {
    helpersCountrySelected.value = helpersCountry[index].value!;
    helpersCountry.refresh();
  }

  onSelectReadyMonth(OptionMonth value) {
    selectedMonth.value = value;
  }

  onSelectReadyYear(OptionYear value) {
    selectedYear.value = value;
  }

  onChangeRangeAge(RangeValues values) {
    currentRangeValues.value = values;
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
    isFiltered.value = true;
  }

  onClearSearch() {
    isFiltered.value = false;
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
  }

  onSelectStatusFilter(int index) {
    helpersStatus[index].selected = !helpersStatus[index].selected!;
    helpersStatus.refresh();
  }

  onSelectNationality(int index) {
    helpersNationality[index].selected = !helpersNationality[index].selected!;
    helpersNationality.refresh();
  }

  onSetNationality(bool isApply, bool isAll) {
    if (isApply) {
      helpersNationalitySelected.clear();
      for (var item in helpersNationality) {
        if (item.selected!) {
          helpersNationalitySelected.add(item);
        }
      }
    } else {
      for (var element in helpersNationality) {
        element.selected = false;
      }
      if (isAll) {
        helpersNationalitySelected.clear();
      } else {
        for (var element in helpersNationalitySelected) {
          final index = helpersNationality.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersNationality[index].selected = true;
          }
        }
      }
    }
  }

  onSelectLanguage(int index) {
    helpersLanguage[index].selected = !helpersLanguage[index].selected!;
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
    } else {
      for (var element in helpersLanguage) {
        element.selected = false;
      }
      if (isAll) {
        helpersLanguageSelected.clear();
      } else {
        for (var element in helpersLanguageSelected) {
          final index = helpersLanguage.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersLanguage[index].selected = true;
          }
        }
      }
    }
  }

  onSelectReligion(int index) {
    helpersReligion[index].selected = !helpersReligion[index].selected!;
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
    } else {
      for (var element in helpersReligion) {
        element.selected = false;
      }
      if (isAll) {
        helpersReligionSelected.clear();
      } else {
        for (var element in helpersReligionSelected) {
          final index = helpersReligion.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersReligion[index].selected = true;
          }
        }
      }
    }
  }

  onSelectEducation(int index) {
    helpersEducation[index].selected = !helpersEducation[index].selected!;
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
    } else {
      for (var element in helpersEducation) {
        element.selected = false;
      }
      if (isAll) {
        helpersEducationSelected.clear();
      } else {
        for (var element in helpersEducationSelected) {
          final index = helpersEducation.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersEducation[index].selected = true;
          }
        }
      }
    }
  }

  onSelectMaritalStatus(int index) {
    helpersMaritalStatus[index].selected = !helpersMaritalStatus[index].selected!;
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
    } else {
      for (var element in helpersMaritalStatus) {
        element.selected = false;
      }
      if (isAll) {
        helpersMaritalStatusSelected.clear();
      } else {
        for (var element in helpersMaritalStatusSelected) {
          final index = helpersMaritalStatus.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersMaritalStatus[index].selected = true;
          }
        }
      }
    }
  }

  onSelectWorkSkill(int index) {
    helpersWorkSkill[index].selected = !helpersWorkSkill[index].selected!;
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
    } else {
      for (var element in helpersWorkSkill) {
        element.selected = false;
      }
      if (isAll) {
        helpersWorkSkillSelected.clear();
      } else {
        for (var element in helpersWorkSkillSelected) {
          final index = helpersWorkSkill.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersWorkSkill[index].selected = true;
          }
        }
      }
    }
  }

  onSelectWorkExperience(int index) {
    helpersWorkExperience[index].selected = !helpersWorkExperience[index].selected!;
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
    } else {
      for (var element in helpersWorkExperience) {
        element.selected = false;
      }
      if (isAll) {
        helpersWorkExperienceSelected.clear();
      } else {
        for (var element in helpersWorkExperienceSelected) {
          final index = helpersWorkExperience.indexWhere((e) => e.value == element.value);
          if (index >= 0) {
            helpersWorkExperience[index].selected = true;
          }
        }
      }
    }
  }
}
