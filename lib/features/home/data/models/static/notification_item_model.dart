import 'package:flutter/material.dart';

class NotificationItemModel {
  final String title;
  final String subTitle;
  final String time;
  final String image;
  final Color backgroundImageColor;
  final bool isRead;

  NotificationItemModel({
    required this.title,
    required this.subTitle,
    required this.time,
    required this.image,
    required this.backgroundImageColor,
    required this.isRead,
  });
}
