import 'package:docdoc/core/cache/cache_helper.dart';
import 'package:docdoc/core/function/get_user_token.dart';
import 'package:docdoc/core/services/service_locator.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

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
