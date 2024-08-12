import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
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
                                const EdgeInsetsDirectional.all(16.0),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.imagesApple,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (state is GetAllSpecialitiesSuccessState)
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
            );
      },
    );
  }
}
