import 'package:docdoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrSignInWithDivider extends StatelessWidget {
  const OrSignInWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffE0E0E0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            "Or sign in with",
            style: TextStyle(
              color: AppColors.rememberMe,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffE0E0E0),
          ),
        ),
      ],
    );
  }
}
