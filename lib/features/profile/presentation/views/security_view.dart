import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../widgets/settings/notification_switch_tile.dart';
import 'package:flutter/material.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  bool _rememberpassword = true;
  bool _faceID = false;
  bool _pin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Security"),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 10),
        child: ListView(
          children: [
            NotificationSwitchTile(
              title: 'Remember password',
              value: _rememberpassword,
              onChanged: (bool value) {
                setState(() {
                  _rememberpassword = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'Face ID',
              value: _faceID,
              onChanged: (bool value) {
                setState(() {
                  _faceID = value;
                });
              },
            ),
            NotificationSwitchTile(
              title: 'PIN',
              value: _pin,
              onChanged: (bool value) {
                setState(() {
                  _pin = value;
                });
              },
            ),
            ListTile(
              contentPadding: const EdgeInsetsDirectional.only(end: 12),
              visualDensity: VisualDensity.compact,
              title: Text(
                "Google Authenticator",
                style: AppStyles.style14W400.copyWith(
                  color: AppColors.black2,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.black2,
                size: 16,
              ),
            ),
            const Divider(
              color: AppColors.textFieldBorder,
            ),
          ],
        ),
      ),
    );
  }
}
