import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomDoctorSpecialityList extends StatelessWidget {
  const CustomDoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: List.generate(
          6,
          (index) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 56,
                    minWidth: 56,
                  ),
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(100),
                    color: AppColors.greyBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(16.0),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.imagesApple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "General",
                  style: AppStyles.style12W400.copyWith(
                    color: AppColors.black2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
