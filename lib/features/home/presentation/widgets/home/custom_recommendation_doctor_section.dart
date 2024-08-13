import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
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
          onTapSeeAll: () {},
        ),
        const SizedBox(height: 12),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: List.generate(
                10,
                (index) {
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 8, bottom: 24),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusDirectional.circular(12),
                          child: Image.asset(
                            Assets.imagesRECOMMENDDOCTOR,
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
                                  state.specializations.specializations[index]
                                      .doctors![0].name!,
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
                                const SizedBox(width: 4),
                                Text(
                                  state.specializations.specializations[index]
                                      .doctors![0].phone!,
                                  style: AppStyles.style12W500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
