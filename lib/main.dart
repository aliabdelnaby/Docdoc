import 'package:flutter/material.dart';

import 'core/cache/cache_helper.dart';
import 'core/function/get_user_token.dart';
import 'core/router/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await getUserToken();
  runApp(const Docdoc());
}

class Docdoc extends StatelessWidget {
  const Docdoc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Docdoc',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.white,
      ),
      routerConfig: router,
    );
  }
}
