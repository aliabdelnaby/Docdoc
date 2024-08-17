import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/my_appointment/data/models/my_appointment_model/my_appointment_model.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/doctor_card.dart';
import 'package:docdoc/features/my_appointment/presentation/widgets/upcoming_btn.dart';
import 'package:flutter/material.dart';

class MyAppointmentUpComingItem extends StatelessWidget {
  const MyAppointmentUpComingItem({
    super.key,
    required this.item,
    required this.index,
  });

  final MyAppointmentModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(16),
      margin: const EdgeInsetsDirectional.only(top: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 30,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          UpcomingDoctorCard(index: index, item: item),
          const Divider(
            color: AppColors.textFieldBorder,
          ),
          Row(
            children: [
              Expanded(
                child: UpcomingBtn(
                  onPressed: () {},
                  text: 'Cancel Appointment',
                  backgroundColor: AppColors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: UpcomingBtn(
                  onPressed: () {},
                  text: 'Reschedule',
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
