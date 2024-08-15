import '../../data/models/specialization_response_model/doctor.dart';
import 'package:go_router/go_router.dart';

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
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    final Doctor doctor = extra?['doctor'] ?? 'Unknown Details';
    final String image = extra?['image'] ?? 'Unknown Details';
    final String rating = extra?['rating'] ?? 'Unknown Details';
    final DateTime selectedDateTime =
        extra?['selectedDateTime'] ?? 'Unknown Details';
    final String note = extra?['note'] ?? 'Unknown Details';

    return Scaffold(
      appBar: buildAppBar(context, title: "Booking Details"),
      bottomNavigationBar: MakeAnAppointmentBtn(
        onPressed: () {
          GoRouter.of(context).pop();
        },
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
              CustomBookInfoItem(
                title: 'Date & Time',
                subtitle: selectedDateTime.toString(),
                image: Assets.imagesScheduleChanged,
                backgroundColor: AppColors.scheduleChanged,
              ),
              const Divider(
                color: AppColors.textFieldBorder,
                height: 30,
              ),
              PaymentInformationListTile(
                backgroundColor: AppColors.videoCallAppointment,
                btnText: 'Get Location',
                image: Assets.imagesAppointmentTypeBookInfo,
                subtitle: note,
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
                      image,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name!,
                          style: AppStyles.style16W700,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${doctor.specialization!.name} | ${doctor.degree}",
                          style: AppStyles.style12W500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.ratingStart,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                rating,
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
