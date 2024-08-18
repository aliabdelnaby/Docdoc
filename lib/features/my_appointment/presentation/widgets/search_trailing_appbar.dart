import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTrailingAppBar extends StatelessWidget {
  const SearchTrailingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SvgPicture.asset(
        Assets.imagesNavSearch,
        colorFilter: const ColorFilter.mode(
          AppColors.black2,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
