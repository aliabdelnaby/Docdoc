import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/views/book_appointment_view.dart.dart';
import '../../features/home/presentation/views/booking_details_view.dart';
import '../../features/home/presentation/views/doctor_details_view.dart';
import '../../features/home/presentation/views/doctor_speciality_view.dart';
import '../../features/home/presentation/views/doctors_speciality_.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/home/presentation/views/recommendation_doctor_view.dart';
import '../../features/home/presentation/widgets/home/nav_bar_widget.dart';
import '../../features/onBorading/presentation/views/onborading_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../services/service_locator.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: '/mainView',
      builder: (context, state) => const UserMainLayoutScreen(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/notificationView',
      builder: (context, state) => const NotificationView(),
    ),
    GoRoute(
      path: '/searchView',
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: '/doctorSpecialityView',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..getAllSpecialities(),
        child: const DoctorSpecialityView(),
      ),
    ),
    GoRoute(
      path: '/recommendationDoctorView',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..getAllSpecialities(),
        child: const RecommendationDoctorView(),
      ),
    ),
    GoRoute(
      path: '/doctorDetailsView',
      builder: (context, state) => const DoctorDetailsView(),
    ),
    GoRoute(
      path: '/doctorsSpeciality',
      builder: (context, state) => const DoctorsSpeciality(),
    ),
    GoRoute(
      path: '/bookAppointmentView',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const BookAppointmentView(),
      ),
    ),
    GoRoute(
      path: '/bookingDetailsView',
      builder: (context, state) => const BookingDetailsView(),
    ),
  ],
);
