import 'package:docdoc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:docdoc/features/auth/presentation/views/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onBorading/presentation/views/onborading_view.dart';
import 'package:go_router/go_router.dart';

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
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
  ],
);
