import '../cache/cache_helper.dart';
import '../services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}
