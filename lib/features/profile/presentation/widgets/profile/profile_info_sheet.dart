import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile/custom_container_item.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile/profile_list_tile.dart';
import 'package:flutter/material.dart';

class CustomProfileInfoSheet extends StatelessWidget {
  const CustomProfileInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
            const Text(
              "Ali Abdelnaby",
              style: AppStyles.style18W600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "aliabdelnabi239@gmail.com",
              style: AppStyles.style14W400,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerItem(
                  onTap: () {},
                  title: "My Appointment",
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(16),
                    topStart: Radius.circular(16),
                  ),
                ),
                const SizedBox(width: 1),
                CustomContainerItem(
                  onTap: () {},
                  title: "Medical records",
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(16),
                    topEnd: Radius.circular(16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ProfileListTile(
              onTap: () {},
              title: "Personal Information",
              image: Assets.imagesPersonalcard,
              backgroundColor: AppColors.scheduleChanged,
            ),
            ProfileListTile(
              onTap: () {},
              title: "My Test & Diagnostic",
              image: Assets.imagesMyTest,
              backgroundColor: AppColors.videoCallAppointment,
            ),
            ProfileListTile(
              onTap: () {},
              title: "Payment",
              image: Assets.imagesNewPaymentAdded,
              backgroundColor: AppColors.appointmentCancelled,
              colorFilter: const ColorFilter.mode(
                AppColors.red2,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
