import 'package:docdoc/features/home/presentation/widgets/home/doctor_speciality_home_item.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
                ? DoctorSpecialityHomeItem(
                    specializationResponseModel: state.specializations,
                  )
                : Container();
      },
    );
  }
}
