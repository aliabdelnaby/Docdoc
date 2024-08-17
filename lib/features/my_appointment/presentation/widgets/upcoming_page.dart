import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/upcoming_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(16),
            margin: const EdgeInsetsDirectional.only(top: 15),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiusDirectional.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.04),
                  blurRadius: 30,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(12),
                      child: Image.asset(
                        Assets.imagesDoctor1,
                        fit: BoxFit.cover,
                        height: 74,
                        width: 74,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr. Randy Wigham",
                            style: AppStyles.style16W700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "General Medical Checkup",
                            style: AppStyles.style12W500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Wed, 17 May | 08.30 AM",
                            style: AppStyles.style12W500.copyWith(
                              color: const Color(0xff616161),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.imagesNavmessage,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.textFieldBorder,
                ),
                Row(
                  children: [
                    Expanded(
                      child: UpcomingBtn(
                        onPressed: () {},
                        text: 'Cancel Appointment',
                        backgroundColor: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: UpcomingBtn(
                        onPressed: () {},
                        text: 'Reschedule',
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
