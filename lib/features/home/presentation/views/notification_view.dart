import '../widgets/notification/custom_notification_header.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import '../widgets/notification/notifaction_view_body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
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
