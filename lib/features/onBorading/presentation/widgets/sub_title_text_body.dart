import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacement('/login');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 52),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Get Started",
                style: AppStyles.style16W600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
