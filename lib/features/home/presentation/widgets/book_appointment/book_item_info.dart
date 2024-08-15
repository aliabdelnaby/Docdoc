import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBookInfoItem extends StatelessWidget {
  const CustomBookInfoItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
  });
  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      dense: true,
      title: Text(
        title,
        style: AppStyles.style14W600,
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.style12W400.copyWith(
          color: AppColors.textGrey,
        ),
      ),
      leading: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
