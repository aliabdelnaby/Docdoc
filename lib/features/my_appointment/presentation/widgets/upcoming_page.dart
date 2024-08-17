import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'UpComing',
        style: AppStyles.style14W400.copyWith(color: AppColors.black2),
      ),
    );
  }
}
