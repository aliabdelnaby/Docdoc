import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorView extends StatelessWidget {
  const RecommendationDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Recommendation Doctor",
        trailing: GestureDetector(
          onTap: () {},
          child: Container(
            constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
            margin:
                const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
            padding: const EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: AppColors.white,
              border: Border.all(
                color: AppColors.textFieldBorder,
              ),
            ),
            child: const Icon(
              Icons.more_horiz_outlined,
              color: AppColors.black2,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Recommendation Doctor View',
        ),
      ),
    );
  }
}
