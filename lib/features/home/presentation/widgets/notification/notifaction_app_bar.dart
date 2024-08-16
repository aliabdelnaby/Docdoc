import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(
  context, {
  required String title,
  Widget? trailing, // Make trailing optional and nullable
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    leadingWidth: 60,
    leading: GestureDetector(
      onTap: () => GoRouter.of(context).pop(),
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(start: 16, top: 5, bottom: 5),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.textFieldBorder,
            width: 1,
          ),
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.black2,
        ),
      ),
    ),
    title: Text(
      title,
      style: AppStyles.style18W600.copyWith(
        color: AppColors.black2,
      ),
    ),
    actions: [
      if (trailing != null) trailing, // Add trailing only if it's not null
    ],
  );
}
