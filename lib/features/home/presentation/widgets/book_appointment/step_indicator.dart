import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/step_circle.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StepCircle(
            isActive: currentStep == 0,
            stepNumber: 1,
            stepLabel: 'Date & Time',
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.textFieldBorder,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          StepCircle(
            stepNumber: 2,
            isActive: currentStep == 1,
            stepLabel: 'Payment',
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.textFieldBorder,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          StepCircle(
            stepNumber: 3,
            isActive: currentStep == 2,
            stepLabel: 'Summary',
          ),
        ],
      ),
    );
  }
}
