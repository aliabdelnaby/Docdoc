import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/custom_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 24, top: 16, bottom: 16),
          child: Text(
            "Yesterday",
            style: AppStyles.style12W500.copyWith(
              color: AppColors.rememberMe,
            ),
          ),
        ),
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        const CustomNotificationItem(),
        const SizedBox(height: 16),
      ],
    );
  }
}
