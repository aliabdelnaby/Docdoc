import 'package:go_router/go_router.dart';

import '../../../../../core/services/service_locator.dart';
import '../../cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../my_appointment/presentation/views/my_appointment_view.dart';
import 'user_bottom_nav_bar_widget.dart';
import '../../../../Inbox/presentation/views/inbox_view.dart';
import '../../views/home_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';

class UserMainLayoutScreen extends StatefulWidget {
  const UserMainLayoutScreen({super.key});

  @override
  State<UserMainLayoutScreen> createState() => _UserMainLayoutScreenState();
}

class _UserMainLayoutScreenState extends State<UserMainLayoutScreen> {
  int currentIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      BlocProvider(
        create: (context) => getIt<HomeCubit>()..getAllSpecialities(),
        child: const HomeView(),
      ),
      const InboxView(),
      const MyAppointmentView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search',
        onPressed: () {
          context.push('/searchView');
        },
        backgroundColor: AppColors.primary,
        elevation: 0,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(24),
            color: AppColors.primary,
          ),
          child: SvgPicture.asset(
            Assets.imagesNavSearch,
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: UserBottomNavBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
