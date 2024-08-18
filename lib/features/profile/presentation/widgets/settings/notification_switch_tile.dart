import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class NotificationSwitchTile extends StatelessWidget {
  const NotificationSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.style14W400.copyWith(color: AppColors.black2),
            ),
            Transform.scale(
              scale: 0.65,
              child: Switch(
                trackOutlineColor: WidgetStateColor.transparent,
                activeColor: AppColors.white,
                inactiveTrackColor: const Color(0xffD9DEE2),
                inactiveThumbColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                value: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        const Divider(
          color: AppColors.textFieldBorder,
        ),
      ],
    );
  }
}
