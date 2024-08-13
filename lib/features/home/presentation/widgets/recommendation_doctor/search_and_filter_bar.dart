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
          onTap: () {},
          child: const Icon(
            Icons.filter_list_rounded,
            color: AppColors.black2,
          ),
        ),
      ],
    );
  }
}
