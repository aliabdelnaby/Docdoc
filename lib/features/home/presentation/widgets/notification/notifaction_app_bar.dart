import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(context) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    leadingWidth: 60,
    leading: InkWell(
      onTap: () => Navigator.pop(context),
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
      'Notification',
      style: AppStyles.style18W600.copyWith(
        color: AppColors.black2,
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsetsDirectional.only(end: 16),
        child: TextButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primary),
            elevation: WidgetStatePropertyAll(0),
          ),
          child: Text(
            '2 NEW',
            style: AppStyles.style10W500,
          ),
        ),
      ),
    ],
  );
}
