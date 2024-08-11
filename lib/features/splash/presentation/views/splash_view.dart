import 'package:docdoc/core/cache/cache_helper.dart';
import 'package:docdoc/core/constants/constants.dart';
import 'package:docdoc/core/services/service_locator.dart';

import '../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;
    if (isOnBoardingVisited) {
      if (token == null) {
        delayedNavigate('/login');
      } else {
        delayedNavigate('/mainView');
      }
    } else {
      delayedNavigate('/onBoarding');
    }
    super.initState();
  }

  void delayedNavigate(path) {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        context.go(path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        Assets.imagesSplash,
        fit: BoxFit.cover,
      ),
    );
  }
}
