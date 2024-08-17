import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'cancelled_page.dart';
import 'completed_page.dart';
import 'upcoming_page.dart';
import 'package:flutter/material.dart';

class MyAppointmentViewBody extends StatelessWidget {
  const MyAppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.rememberMe,
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppStyles.style14W700,
              unselectedLabelStyle: AppStyles.style14W700,
              dividerColor: AppColors.textFieldBorder,
              dividerHeight: 2,
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.none,
                children: [
                  UpComingPage(),
                  CompletedPage(),
                  CancelledPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
