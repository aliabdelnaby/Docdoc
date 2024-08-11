import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserBottomNavBarWidget extends StatelessWidget {
  final void Function(int)? onTap;
  final int currentIndex;

  const UserBottomNavBarWidget({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      backgroundColor: AppColors.white,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 24,
      items: [
        BottomNavigationBarItem(
          tooltip: "Home",
          label: 'Home',
          activeIcon: SvgPicture.asset(
            Assets.imagesNavhome,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(
            Assets.imagesNavhome,
          ),
        ),
        BottomNavigationBarItem(
          tooltip: "Messages",
          label: 'Messages',
          activeIcon: SvgPicture.asset(
            Assets.imagesNavmessage,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(
            Assets.imagesNavmessage,
          ),
        ),
        BottomNavigationBarItem(
          tooltip: "Appointment",
          label: 'Appointment',
          activeIcon: SvgPicture.asset(
            Assets.imagesNavappointment,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(
            Assets.imagesNavappointment,
          ),
        ),
        BottomNavigationBarItem(
          tooltip: "Profile",
          label: 'Profile',
          activeIcon: SvgPicture.asset(
            Assets.imagesNavprofile,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(
            Assets.imagesNavprofile,
          ),
        ),
      ],
    );
  }
}
