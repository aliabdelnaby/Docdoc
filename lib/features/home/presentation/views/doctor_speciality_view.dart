import '../widgets/doctor_speciality/doctor_speciality_view_body.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityView extends StatelessWidget {
  const DoctorSpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Doctor Speciality",
      ),
      body: const DoctorSpecialityViewBody(),
    );
  }
}
