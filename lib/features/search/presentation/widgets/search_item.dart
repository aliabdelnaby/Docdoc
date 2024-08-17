import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/datasource/reecommendation_doctor_item_list_model.dart';
import '../../../home/data/models/specialization_response_model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.doctors});
  final List<Doctor> doctors;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          doctors.length,
          (index) {
            var doctor = doctors[index];
            return GestureDetector(
              onTap: () {
                context.push(
                  '/doctorDetailsView',
                  extra: {
                    'doctor': doctor,
                    'image': reecommendationDoctorList[index].image,
                    'rating': reecommendationDoctorList[index].rateAndReviews,
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(12),
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
                          Text(
                            doctor.name!,
                            style: AppStyles.style16W700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${doctor.specialization!.name} | ${doctor.degree}",
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
                                reecommendationDoctorList[index].rateAndReviews,
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
    );
  }
}
