import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({
    super.key,
    this.onTap,
    this.borderRadius,
    required this.title,
  });
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 34, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.profileGrey,
            borderRadius: borderRadius,
          ),
          child: Text(
            title,
            style: AppStyles.style12W400.copyWith(
              color: AppColors.black2,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
