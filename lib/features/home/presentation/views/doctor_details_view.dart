import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/specialization_response_model/doctor.dart';
import '../widgets/doctor_details/doctor_details_view_body.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import '../widgets/recommendation_doctor/recommendation_doctor_more_btn.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    final Doctor doctor = extra?['doctor'] ?? 'Unknown Details';
    final String image = extra?['image'] ?? 'Unknown Details';
    final String rating = extra?['rating'] ?? 'Unknown Details';
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: doctor.name!,
          trailing: const CustomMoreBtn(),
        ),
        bottomNavigationBar: MakeAnAppointmentBtn(
          text: "Make An Appointment",
          onPressed: () {
            context.push(
              '/bookAppointmentView',
              extra: {
                'doctor': doctor,
                'image': image,
                'rating': rating,
              },
            );
          },
        ),
        body: DoctorDetailsViewBody(
          doctor: doctor,
          name: doctor.name!,
          image: image,
          rating: rating,
          degree: doctor.degree!,
          specialization: doctor.specialization!.name!,
        ),
      ),
    );
  }
}

class MakeAnAppointmentBtn extends StatelessWidget {
  const MakeAnAppointmentBtn({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: const EdgeInsetsDirectional.only(start: 24, end: 24, bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 52),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.style16W600,
        ),
      ),
    );
  }
}
