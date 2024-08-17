import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/datasource/doctor_review_items_list.dart';
import '../../../home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:flutter/material.dart';

class CompletedAndCancelledDoctorCard extends StatelessWidget {
  const CompletedAndCancelledDoctorCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(12),
          child: Image.asset(
            reecommendationDoctorList.elementAt(index).image,
            fit: BoxFit.cover,
            height: 75,
            width: 75,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorReviewList[index].name,
                style: AppStyles.style16W700,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              const Text(
                "General Medical Checkup",
                style: AppStyles.style12W500,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.ratingStart,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      reecommendationDoctorList.elementAt(index).rateAndReviews,
                      style: AppStyles.style12W500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
