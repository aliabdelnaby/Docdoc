import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/notification/custom_notification_header.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import '../widgets/notification/notifaction_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Notification',
        trailing: const Padding(
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
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomNotificationsHeader(),
            SizedBox(height: 16),
            NotificationViewBody(),
          ],
        ),
      ),
    );
  }
}
