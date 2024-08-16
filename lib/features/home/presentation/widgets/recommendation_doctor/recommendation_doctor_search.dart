import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

class RecommendationDoctorSearch extends StatelessWidget {
  const RecommendationDoctorSearch({
    super.key,
    this.onChanged,
    this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        fillColor: AppColors.loginOptions,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: AppStyles.style12W500.copyWith(
          color: AppColors.hintText,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            Assets.imagesNavSearch,
            colorFilter: const ColorFilter.mode(
              AppColors.hintText,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
