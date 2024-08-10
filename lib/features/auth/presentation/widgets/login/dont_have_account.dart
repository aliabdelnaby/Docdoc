import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacement('/register');
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
              style: AppStyles.style11W400.copyWith(
                fontSize: 13,
                color: AppColors.loginBlack,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: AppStyles.style11W600.copyWith(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
