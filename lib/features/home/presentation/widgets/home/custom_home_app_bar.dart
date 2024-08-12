import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, Ali!',
              style: AppStyles.style18W700,
            ),
            const SizedBox(height: 2),
            Text(
              "How Are you Today?",
              style: AppStyles.style11W400.copyWith(
                color: const Color(0xff616161),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            context.push('/notificationView');
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
            padding: const EdgeInsetsDirectional.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(50),
              color: AppColors.flagArrow,
            ),
            child: SvgPicture.asset(
              Assets.imagesNotofication,
            ),
          ),
        ),
      ],
    );
  }
}
