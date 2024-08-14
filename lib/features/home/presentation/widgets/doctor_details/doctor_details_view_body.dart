import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'about_tab.dart';
import 'doctor_details_card_info.dart';
import 'location_tab.dart';
import 'reviews_tab.dart';
import 'package:flutter/material.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({
    super.key,
    required this.image,
    required this.rating,
    required this.name,
    required this.specialization,
    required this.degree,
  });
  final String name, image, rating, specialization, degree;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            DoctordetailsCardInfo(
              image: image,
              rating: rating,
              name: name,
              specialization: specialization,
              degree: degree,
            ),
            const SizedBox(height: 24),
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.rememberMe,
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppStyles.style14W700,
              unselectedLabelStyle: AppStyles.style14W700,
              dividerColor: AppColors.textFieldBorder,
              dividerHeight: 2,
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Location'),
                Tab(text: 'Reviews'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                clipBehavior: Clip.none,
                children: [
                  AboutTab(),
                  LocationTab(),
                  ReviewsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
