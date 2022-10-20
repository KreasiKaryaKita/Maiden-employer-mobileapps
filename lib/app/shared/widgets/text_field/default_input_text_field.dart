import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maiden_employer/app/config/constants/app_constant.dart';

class DefaultInputTextField extends StatelessWidget {
  const DefaultInputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.msgError,
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
  final String? msgError;
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
    return TextField(
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
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEBEBEB),
          ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEBEBEB),
          ),
          borderRadius: BorderRadius.circular(radius ?? 100),
        ),
        filled: true,
        fillColor: fill,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFB4B4B4),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 100),
          borderSide: const BorderSide(
            color: Color(0xFFE1464A),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 100),
          borderSide: const BorderSide(
            color: Color(0xFFE1464A),
            width: 1,
          ),
        ),
        errorText: !validate ? msgError : null,
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xFFE1464A),
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 100),
          borderSide: const BorderSide(
            color: Color(0xFFEBEBEB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 100),
          borderSide: const BorderSide(
            color: Color(0xFFEBEBEB),
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        isCollapsed: true,
      ),
    );
  }
}
