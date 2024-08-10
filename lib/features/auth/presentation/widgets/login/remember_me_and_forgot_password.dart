import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgotPassword extends StatefulWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  State<RememberMeAndForgotPassword> createState() =>
      _RememberMeAndForgotPasswordState();
}

class _RememberMeAndForgotPasswordState
    extends State<RememberMeAndForgotPassword> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
              },
              activeColor: AppColors.primary,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              side: const BorderSide(
                color: AppColors.checkBox,
                width: 2,
              ),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.checkBox,
                  width: 2,
                ),
              ),
            ),
            const Text(
              "Remember me",
              style: AppStyles.style12W400,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            context.push('/forgotPassword');
          },
          child: Text(
            "Forgot Password?",
            style: AppStyles.style12W400.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
