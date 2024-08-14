import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.obscureText,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.filledTextField,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: focusedBorder(),
          hintText: hintText,
          hintStyle: AppStyles.style14W400.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.hintText,
          ),
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.textFieldBorder,
        width: 1,
      ),
    );
  }
}
