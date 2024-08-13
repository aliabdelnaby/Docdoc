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
      body: const Column(
        children: [],
      ),
    );
  }
}
