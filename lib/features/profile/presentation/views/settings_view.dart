import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/profile/presentation/widgets/settings/logout_widget.dart';
import 'package:docdoc/features/profile/presentation/widgets/settings/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Column(
            children: [
              SettingsListTile(
                onTap: () {
                  context.push("/notificationView");
                },
                title: 'Notification',
                image: Assets.imagesSettingsNotification,
              ),
              SettingsListTile(
                onTap: () {
                  context.push("/faqView");
                },
                title: 'FAQ',
                image: Assets.imagesSettingsFaq,
              ),
              SettingsListTile(
                onTap: () {
                  context.push("/securityView");
                },
                title: 'Security',
                image: Assets.imagesSettingsLock,
              ),
              SettingsListTile(
                onTap: () {
                  context.push("/languageView");
                },
                title: 'Language',
                image: Assets.imagesSettingsLanguage,
              ),
              const LogOutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
