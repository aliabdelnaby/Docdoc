import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Profile',
            style: AppStyles.style18W600.copyWith(
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                context.push('/settingsView');
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: SvgPicture.asset(
                  Assets.imagesSetting,
                ),
              ),
            ),
          ],
          leading: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.white,
            size: 20,
          ),
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
