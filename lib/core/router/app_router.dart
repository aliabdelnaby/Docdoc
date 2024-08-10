import 'package:docdoc/features/auth/presentation/views/start_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartView(),
    ),
  ],
);
