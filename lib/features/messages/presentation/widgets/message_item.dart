import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/messages/data/models/message_item_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.filteredMessages,
  });

  final MessageItemModel filteredMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filteredMessages.name,
                style: AppStyles.style14W600,
              ),
              Text(
                "${filteredMessages.specialization} | ${filteredMessages.degree}",
                style: AppStyles.style10W400.copyWith(
                  color: const Color(0xff616161),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          subtitle: Text(
            filteredMessages.message,
            style: AppStyles.style12W400.copyWith(
              color: AppColors.textGrey,
            ),
          ),
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              filteredMessages.image,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filteredMessages.time,
                style: AppStyles.style12W400,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: filteredMessages.isUnread
                      ? AppColors.primary
                      : AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 6.5,
                    end: 6.5,
                    top: 2.5,
                    bottom: 2.5,
                  ),
                  child: Text(
                    filteredMessages.numberOfUnreadMessages!,
                    style: AppStyles.style10W400.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.textFieldBorder,
        ),
      ],
    );
  }
}
