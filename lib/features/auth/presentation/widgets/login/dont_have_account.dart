import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
  });

  final void Function()? onTap;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: AppStyles.style11W400.copyWith(
                fontSize: 13,
                color: AppColors.black2,
              ),
            ),
            TextSpan(
              text: text2,
              style: AppStyles.style11W600.copyWith(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
