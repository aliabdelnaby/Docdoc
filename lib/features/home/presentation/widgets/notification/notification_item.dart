import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationItemModelList,
  });
  final NotificationItemModel notificationItemModelList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        tileColor: notificationItemModelList.isRead
            ? AppColors.white
            : const Color(0xffF2F4F7),
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                color: notificationItemModelList.backgroundImageColor,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: SvgPicture.asset(
                  notificationItemModelList.image,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          notificationItemModelList.title,
          style: AppStyles.style14W600,
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          notificationItemModelList.subTitle,
          style: AppStyles.style12W400,
          textAlign: TextAlign.start,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              notificationItemModelList.time,
              style: AppStyles.style10W400,
            ),
            const SizedBox(height: 8),
            CircleAvatar(
              radius: 4,
              backgroundColor: notificationItemModelList.isRead
                  ? AppColors.white
                  : AppColors.red2,
            ),
          ],
        ),
      ),
    );
  }
}
