import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  child: Image.asset(
                    Assets.imagesDoctor1,
                    fit: BoxFit.cover,
                    height: 74,
                    width: 74,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Randy Wigham',
                        style: AppStyles.style16W700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'General | RSUD Gatot Subroto',
                        style: AppStyles.style12W500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.ratingStart,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '4.8 (4,279 reviews)',
                            style: AppStyles.style12W500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.imagesNavmessage,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
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

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About me',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
            style: AppStyles.style14W400,
          ),
          const SizedBox(height: 24),
          Text(
            'Working Time',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Monday - Friday, 14:00:00 PM - 20:00:00 PM',
            style: AppStyles.style14W400,
          ),
          const SizedBox(height: 24),
          Text(
            'Contact Details',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '1-307-786-4522',
            style: AppStyles.style14W400,
          ),
          const SizedBox(height: 12),
          const Text(
            'muller.russel@example.com',
            style: AppStyles.style14W400,
          ),
          const SizedBox(height: 24),
          Text(
            'Appointment Price',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '300',
            style: AppStyles.style14W400,
          ),
        ],
      ),
    );
  }
}

class LocationTab extends StatelessWidget {
  const LocationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Location Information',
        style: AppStyles.style16W700,
      ),
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Reviews Section',
        style: AppStyles.style16W700,
      ),
    );
  }
}
