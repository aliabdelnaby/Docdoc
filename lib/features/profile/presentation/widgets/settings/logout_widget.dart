import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../cubit/profile_cubit.dart';
import 'logout_dialog.dart';
import 'settings_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListTile(
      onTap: () {
        var profileCubit = context.read<ProfileCubit>();
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return BlocProvider.value(
              value: profileCubit,
              child: const LogOutDialog(),
            );
          },
        );
      },
      title: 'Logout',
      image: Assets.imagesSettingsLogout,
      textColor: AppColors.red2,
    );
  }
}
