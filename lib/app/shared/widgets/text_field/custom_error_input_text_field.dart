import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

class CustomErrorInputTextField extends StatelessWidget {
  const CustomErrorInputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.msgError,
    required this.validate,
    required this.obscureText,
    required this.suffixIcon,
    required this.keyboardType,
    required this.textCapitalization,
    required this.label,
    required this.maxLines,
    required this.onChangeValue,
    required this.action,
    required this.prefixIcon,
    required this.onSubmited,
    this.enabled = true,
    this.maxLength,
    this.radius = 100,
    this.fill = Colors.white,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText, label;
  final String msgError;
  final bool validate, obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final dynamic onChangeValue;
  final dynamic onSubmited;
  final int maxLines;
  final Widget? prefixIcon;
  final TextInputAction action;
  final bool? enabled;
  final int? maxLength;
  final double? radius;
  final Color? fill;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: validate ? Color(0xFFEBEBEB) : Color(0xFFE1464A),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          cursorColor: Color(0xFF333333),
          style: const TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: AppConstant.SF_PRO_FONT,
          ),
          autofocus: false,
          enabled: enabled,
          keyboardType: keyboardType,
          inputFormatters: <TextInputFormatter>[
            if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly
          ],
          textCapitalization: textCapitalization,
          onChanged: onChangeValue,
          onSubmitted: onSubmited,
          textInputAction: action,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            disabledBorder: InputBorder.none,
            filled: true,
            fillColor: fill,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFB4B4B4),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            isCollapsed: true,
          ),
        ),
      ),
    );
  }
}
