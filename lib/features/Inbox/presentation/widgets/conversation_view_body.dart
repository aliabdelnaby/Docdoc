import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/message_item_model.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({super.key, required this.messageItemModel});
  final MessageItemModel messageItemModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 6,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.notificationTile,
                borderRadius: BorderRadiusDirectional.circular(6),
              ),
              child: Text(
                "Session Start",
                style: AppStyles.style10W500.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            BubbleSpecialThree(
              text: 'Hi, ${messageItemModel.name} 🙏',
              color: AppColors.primary,
              tail: true,
              sent: true,
              delivered: true,
              seen: true,
              textStyle: const TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            const BubbleSpecialThree(
              text: 'Good morning, how can I help you?',
              color: AppColors.white,
              tail: true,
              isSender: false,
              textStyle: TextStyle(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 10),
            BubbleSpecialThree(
              text: messageItemModel.message1,
              color: AppColors.primary,
              tail: true,
              sent: true,
              delivered: true,
              seen: true,
              textStyle: const TextStyle(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            BubbleSpecialThree(
              text: messageItemModel.message2,
              color: AppColors.white,
              tail: true,
              isSender: false,
              textStyle: const TextStyle(
                color: AppColors.black2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
