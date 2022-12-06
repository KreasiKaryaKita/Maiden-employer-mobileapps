// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/data/repository/api_repositories.dart';
import 'package:maiden_employer/app/models/response_account_info.dart';
import 'package:maiden_employer/app/models/response_countries.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/option_month.dart';
import 'package:maiden_employer/app/modules/account/authentication/register/models/phone_prefix.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/common/common_function.dart';
import 'package:maiden_employer/app/shared/utils/my_helper.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';

class RegisterStepTwoController extends GetxController {
  RxBool isValidateFirst = false.obs;
  TextEditingController inputName = TextEditingController();
  RxBool validateName = true.obs;
  RxString msgName = "".obs;

  TextEditingController inputPhone = TextEditingController();
  RxBool validatePhone = true.obs;
  RxString msgPhone = "".obs;

  var phonePrefixes = <PhonePrefix>[].obs;
  var selectedPhonePrefix = PhonePrefix().obs;
  var dateCt = TextEditingController();
  var months = <OptionMonth>[].obs;
  var selectedMonth = OptionMonth().obs;
  var yearCt = TextEditingController();
  RxBool validateDate = true.obs;
  RxString msgDate = "".obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  init() {
    getCountries();

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
  }

  onPhonePrefixChanged(PhonePrefix value) {
    selectedPhonePrefix.value = value;
  }

  onMonthChanged(OptionMonth value) {
    selectedMonth.value = value;
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueName = inputName.text.toString().trim();
      String valuePhone = inputPhone.text.toString().trim();
      String valueDate = dateCt.text.toString().trim();
      String valueYear = yearCt.text.toString().trim();

      if (valueName.isEmpty) {
        validateName.value = false;
        msgName.value = "name_validation".tr;
      } else {
        validateName.value = true;
        msgName.value = "";
      }

      if (valuePhone.isEmpty) {
        validatePhone.value = false;
        msgPhone.value = "phone_number_validation".tr;
      } else {
        if (!MyHelpers.validateInputPhoneNumber(valuePhone)) {
          validatePhone.value = false;
          msgPhone.value = "phone_number_validation_2".tr;
        } else {
          validatePhone.value = true;
          msgPhone.value = "";
        }
      }

      if (valueDate.isEmpty || valueYear.isEmpty) {
        validateDate.value = false;
        msgDate.value = "date_of_birth_validation".tr;
      } else {
        if ((int.parse(valueDate) > 0 && int.parse(valueDate) <= 31) && (int.parse(valueYear) <= DateTime.now().year)) {
          validateDate.value = true;
          msgDate.value = "";
        } else {
          validateDate.value = false;
          msgDate.value = "date_of_birth_validation".tr;
        }
      }
    }

    return validateName.value && validatePhone.value;
  }

  getCountries() {
    ApiRepositories.countries().then((value) {
      if (value is ResponseCountries) {
        phonePrefixes.assignAll(value.data!.list!.map((e) {
          var icon = 'assets/images/icon-country-indonesia.svg';
          if (e.code!.toLowerCase().contains('sg')) icon = 'assets/images/icon-country-singapore.svg';
          return PhonePrefix(icon: icon, name: e.phoneCode);
        }));
        onPhonePrefixChanged(phonePrefixes[0]);
      } else {
        phonePrefixes.assignAll([
          PhonePrefix(icon: 'assets/images/icon-country-indonesia.svg', name: '+62'),
          PhonePrefix(icon: 'assets/images/icon-country-singapore.svg', name: '+65'),
        ]);
        onPhonePrefixChanged(phonePrefixes[0]);
      }
    }, onError: (e) {
      phonePrefixes.assignAll([
        PhonePrefix(icon: 'assets/images/icon-country-indonesia.svg', name: '+62'),
        PhonePrefix(icon: 'assets/images/icon-country-singapore.svg', name: '+65'),
      ]);
      onPhonePrefixChanged(phonePrefixes[0]);
    });
  }

  Future doContinue() async {
    isValidateFirst.value = true;
    bool validation = onValidationFormInput(null);
    if (validation) {
      CommonFunction.loadingShow();
      doAccountInfo();
    }
  }

  doAccountInfo() async {
    String birthOfDate =
        "${yearCt.text.toString().trim().padLeft(4, '0')}-${selectedMonth.value.value}-${dateCt.text.toString().trim().padLeft(2, '0')}";
    String fullName = inputName.text.toString().trim();
    var splitName = MyHelpers.getLastNameCommaFirstName(fullName);
    String phone = "${selectedPhonePrefix.value.name}${inputPhone.text.toString().trim()}";

    ApiRepositories.accountInfo(
      birthOfDate: birthOfDate,
      firstName: splitName['first_name'],
      lastName: splitName['last_name'],
      phone: phone,
    ).then((value) {
      CommonFunction.loadingHide();
      if (value is ResponseAccountInfo) {
        PreferenceHelper().set(
          key: PreferenceConstant.USER_TOKEN,
          value: value.data!.token ?? "",
        );
        PreferenceHelper().set(
          key: PreferenceConstant.USER_ID,
          value: value.data!.userId.toString(),
        );
        PreferenceHelper().set(
          key: PreferenceConstant.USER_EMAIL,
          value: value.data!.email.toString(),
        );
        PreferenceHelper().set(
          key: PreferenceConstant.USER_FIRST_NAME,
          value: value.data!.firstName.toString(),
        );
        PreferenceHelper().set(
          key: PreferenceConstant.USER_LAST_NAME,
          value: value.data!.lastName.toString(),
        );
        if (value.data!.birthDate != null) {
          PreferenceHelper().set(
            key: PreferenceConstant.USER_BIRTH_DATE,
            value: DateFormat(
              'dd-MM-yyyy',
              Get.locale.toString(),
            ).format(value.data!.birthDate!).toString(),
          );
        }
        PreferenceHelper().set(
          key: PreferenceConstant.USER_TYPE,
          value: value.data!.userType.toString(),
        );
        PreferenceHelper().set(
          key: PreferenceConstant.USER_TYPE_LABEL,
          value: value.data!.userTypeLabel.toString(),
        );
        Get.offAllNamed(Routes.MAIN);
      } else {
        CommonFunction.snackbarHelper(message: value!.message ?? 'Failed', isSuccess: false);
      }
    }, onError: (e) {
      printError(info: e.toString());
      CommonFunction.loadingHide();
      CommonFunction.snackbarHelper(message: e.toString(), isSuccess: false);
    });
  }
}
