import 'package:docdoc/core/cache/cache_helper.dart';
import 'package:docdoc/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}