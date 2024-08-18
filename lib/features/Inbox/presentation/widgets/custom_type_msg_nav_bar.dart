import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTypeMessage extends StatelessWidget {
  const CustomTypeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.flagArrow,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        margin:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.sentiment_satisfied_alt,
              color: AppColors.rememberMe,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: AppStyles.style14W400.copyWith(
                    color: AppColors.rememberMe,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Icon(
              Icons.attach_file,
              color: AppColors.rememberMe,
            ),
            const SizedBox(width: 15),
            const Icon(
              Icons.camera_alt,
              color: AppColors.rememberMe,
            ),
            const SizedBox(width: 15),
            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 24,
              child: Icon(
                Icons.mic,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
