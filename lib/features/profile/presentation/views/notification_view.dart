import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/profile/presentation/widgets/settings/notification_switch_tile.dart';
import 'package:flutter/material.dart';

class SettingsNotificationView extends StatefulWidget {
  const SettingsNotificationView({super.key});

  @override
  State<SettingsNotificationView> createState() =>
      _SettingsNotificationViewState();
}

class _SettingsNotificationViewState extends State<SettingsNotificationView> {
  bool _notification = true;
  bool _sound = true;
  bool _vibrate = true;
  bool _appUpdates = false;
  bool _specialOffers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Notification'),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 10),
        child: ListView(
          children: [
            NotificationSwitchTile(
              title: 'Notification from Docdoc',
              value: _notification,
              onChanged: (bool value) {
                setState(() {
                  _notification = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'Sound',
              value: _sound,
              onChanged: (bool value) {
                setState(() {
                  _sound = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'Vibrate',
              value: _vibrate,
              onChanged: (bool value) {
                setState(() {
                  _vibrate = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'App Updates',
              value: _appUpdates,
              onChanged: (bool value) {
                setState(() {
                  _appUpdates = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'Special Offers',
              value: _specialOffers,
              onChanged: (bool value) {
                setState(() {
                  _specialOffers = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
