import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/doctor_review_items_list.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 32),
        child: Column(
          children: List.generate(doctorReviewList.length, (index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              titleAlignment: ListTileTitleAlignment.top,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorReviewList[index].name,
                    style: AppStyles.style16W600.copyWith(
                      color: AppColors.black2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      doctorReviewList[index].rating,
                      (index) {
                        return const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.ratingStart,
                          size: 24,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              subtitle: Text(
                doctorReviewList[index].description,
                style: AppStyles.style12W400.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
              trailing: Text(
                doctorReviewList[index].time,
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  doctorReviewList[index].image,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
