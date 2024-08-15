import '../../cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../my_appointment/presentation/views/appointment_view.dart';
import 'user_bottom_nav_bar_widget.dart';
import '../../../../messages/presentation/views/messages_view.dart';
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
        create: (context) => HomeCubit()
          ..getAllSpecialities(),
        child: const HomeView(),
      ),
      const MessagesView(),
      const AppointmentView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search',
        onPressed: () {},
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
