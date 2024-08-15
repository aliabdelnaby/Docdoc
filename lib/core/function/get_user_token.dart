import 'package:flutter/foundation.dart';

import '../cache/cache_helper.dart';
import '../constants/constants.dart';
import '../database/api/end_points.dart';
import '../services/service_locator.dart';

Future<void> getUserToken() async {
  token = await getIt<CacheHelper>().getData(key: ApiKeys.token);
  if (kDebugMode) {
    print(token);
  }
}
