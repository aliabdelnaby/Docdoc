import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/profile/presentation/widgets/settings/logout_dialog.dart';
import 'package:docdoc/features/profile/presentation/widgets/settings/settings_list_tile.dart';
import 'package:flutter/cupertino.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListTile(
      onTap: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return const LogOutDialog();
          },
        );
      },
      title: 'Logout',
      image: Assets.imagesSettingsLogout,
      textColor: AppColors.red2,
    );
  }
}
