import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({super.key});

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
            const Text(
              "770 Delilah Mill\nSteveborough, ME 41454-1846",
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

