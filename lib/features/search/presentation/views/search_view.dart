import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Search"),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchAndFilterBar(
              onTap: () {
                openModalSheet(context);
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: 33),
            Text(
              "Search results",
              style: AppStyles.style18W600.copyWith(
                color: const Color(0xff151515),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    3,
                    (index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(top: 16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadiusDirectional.circular(12),
                              child: Image.asset(
                                reecommendationDoctorList[index].image,
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
                                  const Text(
                                    'Dr. Randy Wigham',
                                    style: AppStyles.style16W700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "General | RSUD Gatot Subroto",
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
                                        reecommendationDoctorList[index]
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
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
