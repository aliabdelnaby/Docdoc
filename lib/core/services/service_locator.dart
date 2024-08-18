import '../../features/my_appointment/presentation/cubit/my_appointment_cubit.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<MyAppointmentCubit>(() => MyAppointmentCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
}
