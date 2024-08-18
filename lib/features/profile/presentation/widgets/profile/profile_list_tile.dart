import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
    this.onTap,
    this.colorFilter,
  });

  final String title;
  final String image;
  final Color backgroundColor;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            title: Text(
              title,
              style: AppStyles.style14W400.copyWith(
                color: AppColors.black2,
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
                colorFilter: colorFilter,
              ),
            ),
          ),
          const Divider(
            color: AppColors.textFieldBorder,
          ),
        ],
      ),
    );
  }
}
