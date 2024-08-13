import 'package:docdoc/features/home/presentation/widgets/home/recommendation_doctor_items_list_list.dart';
import 'package:go_router/go_router.dart';
import 'custom_speciality_title.dart';
import 'package:flutter/material.dart';

class CustomRecommendationDoctorSection extends StatelessWidget {
  const CustomRecommendationDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          text: "Recommendation Doctor",
          onTapSeeAll: () {
            context.push('/recommendationDoctorView');
          },
        ),
        const SizedBox(height: 12),
        const RecommendationDoctorItemsList(
          itemLength: 4,
        ),
      ],
    );
  }
}
