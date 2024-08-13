import '../../features/home/presentation/cubit/home_cubit.dart';
import '../cache/cache_helper.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
