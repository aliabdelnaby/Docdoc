import '../../../data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:go_router/go_router.dart';

import '../../../data/datasource/doctor_speciality_item_list.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomDoctorSpecialityList extends StatelessWidget {
  const CustomDoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is GetAllSpecialitiesLoadingState
            ? const CircularProgressIndicator(
                color: AppColors.primary,
              )
            : state is GetAllSpecialitiesSuccessState
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {
                            context.push(
                              '/doctorsSpeciality',
                              extra: {
                                'specialization': state
                                    .specializations.specializations[index],
                                'imageAndRating':
                                    reecommendationDoctorList[index],
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: index == 0 ? 0 : 24),
                            child: Column(
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 56,
                                    minWidth: 56,
                                  ),
                                  clipBehavior: Clip.none,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(100),
                                    color: AppColors.greyBackground,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.all(20.0),
                                    child: Center(
                                      child: Image.asset(
                                        specialitylList.elementAt(index).image,
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  state.specializations.specializations[index]
                                      .name!,
                                  style: AppStyles.style12W400.copyWith(
                                    color: AppColors.black2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container();
      },
    );
  }
}
