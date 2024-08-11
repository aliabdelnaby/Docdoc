import '../widgets/book_doctor_blue_card.dart';
import '../widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CustomHomeAppBar(),
              BookDoctorBlueCard(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
