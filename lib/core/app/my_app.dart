import 'package:docdoc/core/router/app_router.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
