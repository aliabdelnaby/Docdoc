import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomAuthHeaderTextSection extends StatelessWidget {
  const CustomAuthHeaderTextSection(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.style24W700,
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: AppStyles.style14W400,
          ),
        ],
      ),
    );
  }
}
