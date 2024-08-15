import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import 'doctor_details_view.dart';
import '../widgets/book_appointment/book_item_info.dart';
import '../widgets/book_appointment/payment_info_list_tile.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Booking Details"),
      bottomNavigationBar: MakeAnAppointmentBtn(
        onPressed: () {},
        text: "Done",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 27, end: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Align(
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 65,
                ),
              ),
              const SizedBox(height: 27),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Booking Confirmed",
                  style: AppStyles.style20W500,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Booking Information",
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
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
              const PaymentInformationListTile(
                backgroundColor: AppColors.videoCallAppointment,
                btnText: 'Get Location',
                image: Assets.imagesAppointmentTypeBookInfo,
                subtitle: 'In Person',
                title: 'Appointment Type',
              ),
              const Divider(
                color: AppColors.textFieldBorder,
                height: 30,
              ),
              const SizedBox(height: 10),
              Text(
                "Doctor Information",
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
