import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app/my_App.dart';
import 'core/cache/cache_helper.dart';
import 'core/function/get_user_token.dart';
import 'core/services/service_locator.dart';
import 'core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await getUserToken();
  Bloc.observer = MyBlocObserver();
  runApp(const Docdoc());
}
