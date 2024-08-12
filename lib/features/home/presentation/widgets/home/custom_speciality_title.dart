import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.text,
    this.onTapSeeAll,
  });

  final String text;
  final void Function()? onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppStyles.style18W600,
          ),
        ),
        InkWell(
          onTap: onTapSeeAll,
          child: Text(
            "See All",
            style: AppStyles.style12W400.copyWith(
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
