import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_speciality/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorSpecialityViewBody extends StatelessWidget {
  const DoctorSpecialityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is GetAllSpecialitiesLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : state is GetAllSpecialitiesSuccessState
                ? GridView.builder(
                    padding: const EdgeInsetsDirectional.only(
                      top: 42,
                      start: 30,
                      end: 30,
                      bottom: 20,
                    ),
                    itemCount: state.specializations.specializations.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 36,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      var item = state.specializations.specializations[index];
                      var i = index;
                      return DoctorSpecialityItem(
                        item: item,
                        index: i,
                      );
                    },
                  )
                : const SizedBox();
      },
    );
  }
}
