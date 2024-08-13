import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMoreBtn extends StatelessWidget {
  const CustomMoreBtn({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.textFieldBorder,
          ),
        ),
        child: const Icon(
          Icons.more_horiz_outlined,
          color: AppColors.black2,
        ),
      ),
    );
  }
}
