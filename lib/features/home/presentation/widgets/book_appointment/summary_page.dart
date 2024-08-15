import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/book_item_info.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking Information',
            style: AppStyles.style16W600.copyWith(
              color: const Color(0xff070C18),
            ),
          ),
          const SizedBox(height: 24),
          const CustomBookInfoItem(
            title: 'Date & Time',
            subtitle: 'Wednesday, 08 May 2023\n14:00 PM',
            image: Assets.imagesScheduleChanged,
            backgroundColor: AppColors.scheduleChanged,
          ),
          const Divider(
            color: AppColors.textFieldBorder,
            height: 30,
          ),
          const CustomBookInfoItem(
            title: 'Appointment Type',
            subtitle: 'In Person',
            image: Assets.imagesAppointmentTypeBookInfo,
            backgroundColor: AppColors.videoCallAppointment,
          ),
          const Divider(
            color: AppColors.textFieldBorder,
            height: 30,
          ),
        ],
      ),
    );
  }
}
