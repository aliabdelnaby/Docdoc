import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorItemsList extends StatelessWidget {
  const RecommendationDoctorItemsList({
    super.key,
    required this.itemLength,
  });
  final int itemLength;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is GetAllSpecialitiesLoadingState
            ? const CircularProgressIndicator(
                color: AppColors.primary,
              )
            : Column(
                children: List.generate(
                  itemLength,
                  (index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8, bottom: 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadiusDirectional.circular(12),
                              child: Image.asset(
                                reecommendationDoctorList
                                    .elementAt(index)
                                    .image,
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                            ),
                            const SizedBox(width: 16),
                            if (state is GetAllSpecialitiesSuccessState)
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state
                                          .specializations
                                          .specializations[index]
                                          .doctors![0]
                                          .name!,
                                      style: AppStyles.style16W700,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${state.specializations.specializations[index].name!} | ${state.specializations.specializations[index].doctors![0].degree}",
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
              );
      },
    );
  }
}