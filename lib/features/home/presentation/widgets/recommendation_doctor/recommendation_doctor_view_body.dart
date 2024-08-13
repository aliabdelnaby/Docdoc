import 'package:docdoc/features/home/presentation/widgets/home/recommendation_doctor_items_list_list.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorViewBody extends StatelessWidget {
  const RecommendationDoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(start: 18, end: 18, top: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchAndFilterBar(),
            SizedBox(height: 24),
            RecommendationDoctorItemsList(
              itemLength: 10,
            ),
          ],
        ),
      ),
    );
  }
}
