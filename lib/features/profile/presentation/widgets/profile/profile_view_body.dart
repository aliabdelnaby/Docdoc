import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile/profile_info_sheet.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.14),
            const CustomProfileInfoSheet(),
          ],
        ),
        const Positioned(
          top: 60,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              Assets.imagesProfileAvatar,
            ),
          ),
        ),
      ],
    );
  }
}
