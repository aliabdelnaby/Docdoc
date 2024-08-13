import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/modal_sheet_filter_doctors.dart';
import '../../../../../core/utils/app_colors.dart';
import 'recommendation_doctor_search.dart';
import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: RecommendationDoctorSearch(),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            _openModalSheet(context);
          },
          child: const Icon(
            Icons.filter_list_rounded,
            color: AppColors.black2,
          ),
        ),
      ],
    );
  }
}

void _openModalSheet(BuildContext context) {
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
      return const CustomSheetFilterRecommendationDoctors();
    },
  );
}
