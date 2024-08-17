import '../../../data/models/specialization_response_model/doctor.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({super.key, required this.doctor});
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
              'Practice Place',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              doctor.address!,
              style: AppStyles.style14W400,
            ),
            const SizedBox(height: 24),
            Text(
              'Location Map',
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(
              Assets.imagesLocationMap,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
