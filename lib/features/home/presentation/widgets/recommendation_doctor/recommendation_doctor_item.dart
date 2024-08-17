import 'package:docdoc/features/home/data/models/specialization_response_model/specialization_response_model.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendationDoctorItem extends StatelessWidget {
  const RecommendationDoctorItem({
    super.key,
    required this.index,
    required this.item,
  });
  final int index;
  final Specialization item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          '/doctorDetailsView',
          extra: {
            'doctor': item.doctors![0],
            'image': reecommendationDoctorList[index].image,
            'rating': reecommendationDoctorList[index].rateAndReviews,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, bottom: 24),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(12),
              child: Image.asset(
                reecommendationDoctorList.elementAt(index).image,
                fit: BoxFit.cover,
                height: 110,
                width: 110,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.doctors![0].name!,
                    style: AppStyles.style16W700,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${item.name!} | ${item.doctors![0].degree}",
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
                      Text(
                        reecommendationDoctorList
                            .elementAt(index)
                            .rateAndReviews,
                        style: AppStyles.style12W500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
