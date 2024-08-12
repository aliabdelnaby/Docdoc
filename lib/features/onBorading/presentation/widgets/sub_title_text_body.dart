import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/function/onboarding.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'auth_brn.dart';

class SubTitleTextAndBtn extends StatelessWidget {
  const SubTitleTextAndBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
      child: Column(
        children: [
          const Text(
            "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
            style: AppStyles.style14W400,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomAuthBtn(
            onPressed: () {
              onBoardingVisited();
              context.pushReplacement('/login');
            },
            text: "Get Started",
          ),
        ],
      ),
    );
  }
}
