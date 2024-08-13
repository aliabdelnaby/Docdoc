import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_details/doctor_details_view_body.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/recommendation_doctor_more_btn.dart';
import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Doctor Name",
        trailing: const CustomMoreBtn(),
      ),
      bottomNavigationBar: MakeAnAppointmentBtn(
        onPressed: () {},
      ),
      body: const DoctorDetailsViewBody(),
    );
  }
}

class MakeAnAppointmentBtn extends StatelessWidget {
  const MakeAnAppointmentBtn({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 52),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "Make An Appointment",
          style: AppStyles.style16W600,
        ),
      ),
    );
  }
}
