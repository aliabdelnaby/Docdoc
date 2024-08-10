import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginHeaderText extends StatelessWidget {
  const LoginHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back',
            style: AppStyles.style24W700,
          ),
          SizedBox(height: 8),
          Text(
            "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
            style: AppStyles.style14W400,
          ),
        ],
      ),
    );
  }
}
