import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class UpcomingBtn extends StatelessWidget {
  const UpcomingBtn({
    super.key,
    this.onPressed,
    required this.text,
    required this.backgroundColor,
    this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
      child: Text(
        text,
        style: AppStyles.style12W600
            .copyWith(color: textColor ?? AppColors.primary),
      ),
    );
  }
}
