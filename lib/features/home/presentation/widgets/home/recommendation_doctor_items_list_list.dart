import '../recommendation_doctor/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';

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
            : state is GetAllSpecialitiesSuccessState
                ? Column(
                    children: List.generate(
                      itemLength,
                      (index) {
                        var item = state.specializations.specializations[index];
                        var i = index;
                        return RecommendationDoctorItem(
                          item: item,
                          index: i,
                        );
                      },
                    ),
                  )
                : Container();
      },
    );
  }
}
