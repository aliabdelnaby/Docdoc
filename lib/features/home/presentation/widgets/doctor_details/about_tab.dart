import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Working Time',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Monday - Friday, 14:00:00 PM - 20:00:00 PM',
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Contact Details',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '1-307-786-4522',
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 12),
            const Text(
              'muller.russel@example.com',
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Appointment Price',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '300',
              style: AppStyles.style14W400,
            ),
          ],
        ),
      ),
    );
  }
}
