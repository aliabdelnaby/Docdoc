import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomNotificationsHeader extends StatelessWidget {
  const CustomNotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today',
          style: AppStyles.style12W500.copyWith(
            color: AppColors.rememberMe,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Mark all as read',
            style: AppStyles.style12W400.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
