import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorViewBody extends StatelessWidget {
  const RecommendationDoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.all(18),
      child: Column(
        children: [
          SearchAndFilterBar(),
        ],
      ),
    );
  }
}
