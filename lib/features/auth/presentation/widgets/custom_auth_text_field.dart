import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.filledTextField,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          hintText: hintText,
          hintStyle: AppStyles.style14W400.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.hintText,
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
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
