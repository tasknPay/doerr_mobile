import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize sub-modules

  // Register core dependencies
  sl
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);

  sl.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  await sl.allReady();
}
