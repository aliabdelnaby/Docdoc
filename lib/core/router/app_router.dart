import 'package:docdoc/features/splash/presentation/views/splash_view.dart';
import 'package:docdoc/features/splash/presentation/views/start_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/start',
      builder: (context, state) => const StartView(),
    ),
  ],
);
