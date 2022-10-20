import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';
import 'package:maiden_employer/app/config/themes/app_colors.dart';
import 'package:maiden_employer/app/shared/widgets/buttons/button_fill.dart';
import 'package:maiden_employer/app/shared/widgets/text_field/default_input_text_field.dart';

import '../controllers/register_step_two_controller.dart';

class RegisterStepTwoView extends GetView<RegisterStepTwoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'create_profile'.tr.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF212121),
            fontFamily: AppConstant.SF_PRO_FONT,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/images/icon-back.svg'),
        ),
        elevation: 0,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  Text(
                    '${'step'.tr.toUpperCase()} 2 ${'of'.tr.toUpperCase()} 2',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF333333),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'create_your_profile'.tr,
                    style: TextStyle(
                      fontFamily: AppConstant.CENTURY_GOTHIC_FONT,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xFF333333),
                    ),
                  ).marginOnly(top: 10),
                  Text(
                    'register_two_info'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF828282),
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10, bottom: 24),
                  Text(
                    '${'name'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppConstant.SF_PRO_FONT,
                    ),
                  ).marginOnly(top: 10, bottom: 8),
                  DefaultInputTextField(
                    controller: controller.inputName,
                    hintText: 'Eg. John Doe',
                    msgError: controller.msgName.value,
                    validate: controller.validateName.value,
                    obscureText: false,
                    suffixIcon: null,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    label: 'email'.tr,
                    maxLines: 1,
                    onChangeValue: controller.onValidationFormInput,
                    action: TextInputAction.done,
                    onSubmited: null,
                    prefixIcon: null,
                    radius: 8,
                    maxLength: 15,
                  ).marginOnly(bottom: 24),
                  Text(
                    '${'phone_number'.tr}*',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ).marginOnly(bottom: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<PhonePrefixModel>(
                              items: List.generate(controller.phonePrefixes.length, (index) {
                                var item = controller.phonePrefixes[index];
                                return DropdownMenuItem(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(item.icon ?? ''),
                                      Text(item.name ?? ''),
                                    ],
                                  ),
                                  value: item,
                                );
                              }),
                              hint: Text(
                                '+65',
                                style: TextStyle(
                                  color: Color(0xFFB4B4B4),
                                ),
                              ),
                              isDense: true,
                              isExpanded: true,
                              value:
                                  controller.selectedPhonePrefix.name == null ? null : controller.selectedPhonePrefix,
                              onChanged: (value) => controller.onPhonePrefixChanged(value!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 6,
                        child: DefaultInputTextField(
                          controller: controller.inputPhone,
                          hintText: 'Eg. 8523474023',
                          msgError: controller.msgPhone.value,
                          validate: controller.validatePhone.value,
                          obscureText: false,
                          suffixIcon: null,
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                          label: 'email'.tr,
                          maxLines: 1,
                          onChangeValue: controller.onValidationFormInput,
                          action: TextInputAction.done,
                          onSubmited: null,
                          prefixIcon: null,
                          radius: 8,
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 24),
                  Text(
                    'date_of_birth'.tr,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ).marginOnly(bottom: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DefaultInputTextField(
                          controller: controller.dateCt,
                          hintText: 'DD',
                          msgError: "",
                          validate: controller.validateDate.value,
                          obscureText: false,
                          suffixIcon: null,
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                          label: 'DD'.tr,
                          maxLines: 1,
                          onChangeValue: controller.onValidationFormInput,
                          action: TextInputAction.done,
                          onSubmited: null,
                          prefixIcon: null,
                          radius: 8,
                          maxLength: 2,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: List.generate(
                                controller.months.length,
                                (index) {
                                  var item = controller.months[index];
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  );
                                },
                              ),
                              isDense: true,
                              isExpanded: true,
                              hint: Text(
                                'Mon',
                                style: TextStyle(
                                  color: Color(0xFFB4B4B4),
                                ),
                              ),
                              value: controller.selectedMonth.value.isEmpty ? null : controller.selectedMonth.value,
                              onChanged: (value) => controller.onMonthChanged(value!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DefaultInputTextField(
                          controller: controller.yearCt,
                          hintText: 'YYYY',
                          msgError: "",
                          validate: controller.validateDate.value,
                          obscureText: false,
                          suffixIcon: null,
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                          label: 'YYYY'.tr,
                          maxLines: 1,
                          onChangeValue: controller.onValidationFormInput,
                          action: TextInputAction.done,
                          onSubmited: null,
                          prefixIcon: null,
                          radius: 8,
                          maxLength: 4,
                        ),
                      ),
                    ],
                  ),
                  if (!controller.validateDate.value)
                    Text(
                      controller.msgDate.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFE1464A),
                        fontSize: 12,
                      ),
                    ).marginOnly(top: 4),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         blurRadius: 4,
            //         spreadRadius: 0.2,
            //         color: Color(0xFFE0E0E0),
            //       ),
            //     ],
            //   ),
            //   child: ButtonFill(
            //     onPressed: !controller.isAgree.value ? null : controller.doContinue,
            //     backgroundColor: !controller.isAgree.value ? Color(0xFFB4B4B4) : AppColors.primary_60,
            //     text: Text(
            //       'continue'.tr,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),

      // body: Obx(
      //   () => Form(
      //     key: controller.formKey,
      //     autovalidateMode: controller.isAutoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Expanded(
      //           child: SingleChildScrollView(
      //             padding: EdgeInsets.symmetric(horizontal: 27),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   '${'step'.tr.toUpperCase()} 2 ${'of'.tr.toUpperCase()} 2',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w700,
      //                     fontSize: 12,
      //                     color: Color(0xFF333333),
      //                   ),
      //                 ).marginOnly(top: 10),
      //                 Text(
      //                   'create_your_profile'.tr,
      //                   style: TextStyle(
      //                     fontFamily: 'Century-Gothic',
      //                     fontWeight: FontWeight.w700,
      //                     fontSize: 24,
      //                     color: Color(0xFF333333),
      //                   ),
      //                 ).marginOnly(top: 10),
      //                 Text(
      //                   'register_two_info'.tr,
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w400,
      //                     fontSize: 14,
      //                     color: Color(0xFF828282),
      //                   ),
      //                 ).marginOnly(top: 10, bottom: 24),
      //                 Text(
      //                   '${'name'.tr}*',
      //                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
      //                 ).marginOnly(top: 10, bottom: 8),
      //                 TextFormField(
      //                   controller: controller.nameCt,
      //                   // validator: (value) => ValidatorHelper.name(value!),
      //                   keyboardType: TextInputType.emailAddress,
      //                   textInputAction: TextInputAction.next,
      //                   decoration: InputDecoration(
      //                     isDense: true,
      //                     contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
      //                     hintText: 'Eg. John Doe',
      //                   ),
      //                 ),
      //                 Text(
      //                   '${'phone_number'.tr}*',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w700,
      //                     fontSize: 12,
      //                   ),
      //                 ).marginOnly(top: 15, bottom: 8),
      //                 Row(
      //                   children: [
      //                     Expanded(
      //                       flex: 3,
      //                       child: Container(
      //                         padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      //                         decoration: BoxDecoration(
      //                           border: Border.all(color: Color(0xFFEBEBEB)),
      //                           borderRadius: BorderRadius.all(
      //                             Radius.circular(4),
      //                           ),
      //                         ),
      //                         child: DropdownButtonHideUnderline(
      //                           child: DropdownButton<PhonePrefixModel>(
      //                             items: List.generate(controller.phonePrefixes.length, (index) {
      //                               var item = controller.phonePrefixes[index];
      //                               return DropdownMenuItem(
      //                                 child: Row(
      //                                   mainAxisSize: MainAxisSize.min,
      //                                   mainAxisAlignment: MainAxisAlignment.start,
      //                                   children: [
      //                                     SvgPicture.asset(item.icon ?? ''),
      //                                     Text(item.name ?? ''),
      //                                   ],
      //                                 ),
      //                                 value: item,
      //                               );
      //                             }),
      //                             hint: Text(
      //                               '+65',
      //                               style: TextStyle(
      //                                 color: Color(0xFFB4B4B4),
      //                               ),
      //                             ),
      //                             isDense: true,
      //                             isExpanded: true,
      //                             value: controller.selectedPhonePrefix.name == null
      //                                 ? null
      //                                 : controller.selectedPhonePrefix,
      //                             onChanged: (value) => controller.onPhonePrefixChanged(value!),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(width: 10),
      //                     Expanded(
      //                       flex: 6,
      //                       child: TextFormField(
      //                         controller: controller.phoneCt,
      //                         // validator: (value) => ValidatorHelper.numeric(value!),
      //                         keyboardType: TextInputType.phone,
      //                         textInputAction: TextInputAction.next,
      //                         decoration: InputDecoration(
      //                           isDense: true,
      //                           contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
      //                           hintText: 'Eg. 82991414',
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Text(
      //                   'date_of_birth'.tr,
      //                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
      //                 ).marginOnly(top: 15, bottom: 8),
      //                 Row(
      //                   children: [
      //                     Expanded(
      //                       child: TextFormField(
      //                         controller: controller.dateCt,
      //                         keyboardType: TextInputType.number,
      //                         textInputAction: TextInputAction.next,
      //                         decoration: InputDecoration(
      //                           isDense: true,
      //                           contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
      //                           hintText: 'DD',
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(width: 10),
      //                     Expanded(
      //                       child: Container(
      //                         padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      //                         decoration: BoxDecoration(
      //                           border: Border.all(color: Color(0xFFEBEBEB)),
      //                           borderRadius: BorderRadius.all(
      //                             Radius.circular(4),
      //                           ),
      //                         ),
      //                         child: DropdownButtonHideUnderline(
      //                           child: DropdownButton<String>(
      //                             items: List.generate(
      //                               controller.months.length,
      //                               (index) {
      //                                 var item = controller.months[index];
      //                                 return DropdownMenuItem(
      //                                   child: Text(item),
      //                                   value: item,
      //                                 );
      //                               },
      //                             ),
      //                             isDense: true,
      //                             isExpanded: true,
      //                             hint: Text(
      //                               'Mon',
      //                               style: TextStyle(
      //                                 color: Color(0xFFB4B4B4),
      //                               ),
      //                             ),
      //                             value: controller.selectedMonth.value.isEmpty ? null : controller.selectedMonth.value,
      //                             onChanged: (value) => controller.onMonthChanged(value!),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(width: 10),
      //                     Expanded(
      //                       child: TextFormField(
      //                         controller: controller.yearCt,
      //                         keyboardType: TextInputType.number,
      //                         textInputAction: TextInputAction.next,
      //                         decoration: InputDecoration(
      //                           isDense: true,
      //                           contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 13),
      //                           hintText: 'YYYY',
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                 blurRadius: 4,
      //                 spreadRadius: 0.2,
      //                 color: Color(0xFFE0E0E0),
      //               ),
      //             ],
      //           ),
      //           child: ButtonFill(
      //             onPressed: !controller.isRegisterEnabled() ? null : controller.onRegisterStepTwo,
      //             backgroundColor: !controller.isRegisterEnabled() ? Color(0xFFB4B4B4) : AppColors.primary_60,
      //             text: Text(
      //               'continue'.tr,
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.w700,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}