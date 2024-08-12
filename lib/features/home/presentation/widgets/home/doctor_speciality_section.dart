import 'package:go_router/go_router.dart';

import 'custom_doctor_speciality_list.dart';
import 'custom_speciality_title.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySection extends StatelessWidget {
  const DoctorSpecialitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          text: "Doctor Speciality",
          onTapSeeAll: () {
            context.push('/doctorSpecialityView');
          },
        ),
        const SizedBox(height: 16),
        const CustomDoctorSpecialityList(),
      ],
    );
  }
}
