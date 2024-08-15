import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DateAndTimePage extends StatelessWidget {
  const DateAndTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Date',
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Set Manual',
                  style: AppStyles.style12W500.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
