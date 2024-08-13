import '../widgets/notification/notifaction_app_bar.dart';
import '../widgets/recommendation_doctor/recommendation_doctor_more_btn.dart';
import '../widgets/recommendation_doctor/recommendation_doctor_view_body.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorView extends StatelessWidget {
  const RecommendationDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Recommendation Doctor",
        trailing: const RecommendationDoctorMoreBtn(),
      ),
      body: const RecommendationDoctorViewBody(),
    );
  }
}
