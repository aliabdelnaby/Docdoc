import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model/specialization_response_model.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorsSpeciality extends StatelessWidget {
  const DoctorsSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    final Specialization specialization =
        extra?['specialization'] ?? 'Unknown Details';
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: specialization.name!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(16),
          child: Column(
            children: List.generate(
              specialization.doctors!.length,
              (index) {
                return InkWell(
                  onTap: () {
                    context.push(
                      '/doctorDetailsView',
                      extra: {
                        'doctor': specialization.doctors![index],
                        'image': reecommendationDoctorList[index].image,
                        'rating':
                            reecommendationDoctorList[index].rateAndReviews,
                      },
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 8, bottom: 24),
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
                                specialization.doctors![index].name!,
                                style: AppStyles.style16W700,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${specialization.name} | ${specialization.doctors![index].degree}",
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
