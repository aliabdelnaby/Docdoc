import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'book_item_info.dart';
import 'payment_info_list_tile.dart';
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
          const SizedBox(height: 9),
          Text(
            'Booking Information',
            style: AppStyles.style16W600.copyWith(
              color: const Color(0xff070C18),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(12),
                child: Image.asset(
                  Assets.imagesDoctor1,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Randy Wigham',
                      style: AppStyles.style16W700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "General | RSUD Gatot Subroto",
                      style: AppStyles.style12W500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.ratingStart,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '4.8 (4,279 reviews)',
                            style: AppStyles.style12W500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Payment Information',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 24),
          const PaymentInformationListTile(
            backgroundColor: Color(0xffF1F1F1),
            btnText: 'Change',
            image: Assets.imagesMastercard,
            subtitle: '***** ***** ***** 37842',
            title: 'Master Card',
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Total',
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              Text(
                '\$4944',
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
