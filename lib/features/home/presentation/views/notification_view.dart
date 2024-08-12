import 'package:docdoc/features/home/presentation/widgets/notification/custom_notification_header.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            CustomNotificationsHeader(),
          ],
        ),
      ),
    );
  }
}
