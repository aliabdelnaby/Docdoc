import 'package:docdoc/features/home/data/models/specialization_response_model/doctor.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.doctor});
  final Doctor doctor;
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
            Text(
              "${doctor.name} is a dedicated ${doctor.degree} with a specialization in ${doctor.specialization!.name}. They are committed to providing compassionate and patient-centered care, utilizing the latest advancements in medical science to achieve optimal health outcomes.\n\n${doctor.name} believes in building strong relationships with their patients, fostering open communication, and empowering them to take an active role in their health journey.",
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
            Text(
              'Monday - Friday, ${doctor.startTime} - ${doctor.endTime}',
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
            Text(
              doctor.phone!,
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 12),
            Text(
              doctor.email!,
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
            Text(
              doctor.appointPrice!.toString(),
              style: AppStyles.style14W400,
            ),
          ],
        ),
      ),
    );
  }
}
