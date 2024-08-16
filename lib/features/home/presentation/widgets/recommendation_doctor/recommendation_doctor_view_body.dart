import 'package:flutter/material.dart';

import '../home/recommendation_doctor_items_list_list.dart';
import 'search_and_filter_bar.dart';

class RecommendationDoctorViewBody extends StatelessWidget {
  const RecommendationDoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 18, end: 18, top: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchAndFilterBar(
              onTap: () {
                openModalSheet(context);
              },
            ),
            const SizedBox(height: 24),
            const RecommendationDoctorItemsList(
              itemLength: 10,
            ),
          ],
        ),
      ),
    );
  }
}
