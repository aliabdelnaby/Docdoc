import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/custom_speciality_title.dart';
import 'package:flutter/material.dart';

class CustomRecommendationDoctorSection extends StatelessWidget {
  const CustomRecommendationDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          text: "Recommendation Doctor",
          onTapSeeAll: () {},
        ),
        const SizedBox(height: 12),
        Column(
          children: List.generate(
            5,
            (index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, bottom: 24),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        Assets.imagesRECOMMENDDOCTOR,
                        fit: BoxFit.cover,
                        height: 110,
                        width: 110,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Randy Wigham",
                          style: AppStyles.style16W700,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "General | RSUD Gatot Subroto",
                          style: AppStyles.style12W500,
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.ratingStart,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "4.8 (4,279 reviews)",
                              style: AppStyles.style12W500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
