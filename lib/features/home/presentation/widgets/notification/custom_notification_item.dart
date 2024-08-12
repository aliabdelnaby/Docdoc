import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      tileColor: const Color(0xffF2F4F7),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffE9FAEF),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: SvgPicture.asset(
                Assets.imagesAppointmentSuccess,
              ),
            ),
          ),
        ],
      ),
      title: const Text(
        'Appointment Success',
        style: AppStyles.style14W600,
        textAlign: TextAlign.start,
      ),
      subtitle: const Text(
        "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
        style: AppStyles.style12W400,
        textAlign: TextAlign.start,
      ),
      trailing: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '1h',
            style: AppStyles.style10W400,
          ),
          SizedBox(height: 8),
          CircleAvatar(
            radius: 4,
            backgroundColor: AppColors.red2,
          ),
        ],
      ),
    );
  }
}
