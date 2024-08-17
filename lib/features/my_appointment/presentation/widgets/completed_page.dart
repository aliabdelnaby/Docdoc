import '../../../../core/utils/app_colors.dart';
import 'completed_cancelled_doctor_card.dart';
import 'status_and_date.dart';
import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          3,
          (index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                bottom: 21,
              ),
              margin: const EdgeInsetsDirectional.only(top: 15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
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
                  AppointmentStatusAndDateWidget(
                    index: index,
                    color: const Color(0xff22C55E),
                    status: "Appointment done",
                  ),
                  const Divider(
                    color: AppColors.textFieldBorder,
                  ),
                  CompletedAndCancelledDoctorCard(index: index),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
