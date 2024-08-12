import 'package:docdoc/core/app/my_App.dart';
import 'package:flutter/material.dart';
import 'core/cache/cache_helper.dart';
import 'core/function/get_user_token.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await getUserToken();
  runApp(const Docdoc());
}

