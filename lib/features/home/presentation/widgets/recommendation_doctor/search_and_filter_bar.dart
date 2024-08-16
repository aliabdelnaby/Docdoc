import '../../cubit/home_cubit.dart';
import 'modal_sheet_filter_doctors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import 'recommendation_doctor_search.dart';
import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: RecommendationDoctorSearch(),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.filter_list_rounded,
            color: AppColors.black2,
          ),
        ),
      ],
    );
  }
}

void openModalSheet(BuildContext context) {
  var getAllSpecialities = context.read<HomeCubit>();
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
    builder: (context) {
      return BlocProvider.value(
        value: getAllSpecialities,
        child: const FilterRecommendationDoctorsSheet(),
      );
    },
  );
}
