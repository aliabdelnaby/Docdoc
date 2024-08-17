import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Completed',
        style: AppStyles.style14W400.copyWith(color: AppColors.black2),
      ),
    );
  }
}
