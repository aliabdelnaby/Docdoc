import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final bool isActive;
  final String stepLabel;
  final int stepNumber;

  const StepCircle({
    super.key,
    required this.isActive,
    required this.stepLabel,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isActive ? AppColors.primary : AppColors.stepperGrey,
          child: Text(
            "$stepNumber",
            style: AppStyles.style12W500.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          stepLabel,
          style: AppStyles.style12W400.copyWith(
            color: isActive ? AppColors.black2 : AppColors.rememberMe,
          ),
        ),
      ],
    );
  }
}
