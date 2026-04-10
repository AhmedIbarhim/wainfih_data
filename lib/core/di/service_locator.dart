import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/add_provider/data/data_sources/provider_remote_data_source.dart';
import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../features/lookups/data/data_sources/lookups_remote_data_source.dart';
import '../../features/my_providers/data/data_sources/my_providers_remote_data_source.dart';
import '../networking/api_client.dart';
import '../networking/api_interceptor.dart';
import '../offline/queue_manager.dart';
import '../offline/submission_queue.dart';

final GetIt locator = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> setupServiceLocator() async {
  // Core singletons
  const secureStorage = FlutterSecureStorage();
  final sharedPrefs = SharedPreferencesAsync();

  locator.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  locator.registerLazySingleton<SharedPreferencesAsync>(() => sharedPrefs);

  // Auth local data source (singleton — used by interceptor)
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      locator<SharedPreferencesAsync>(),
      locator<FlutterSecureStorage>(),
    ),
  );

  // API interceptor + client
  locator.registerLazySingleton<ApiInterceptor>(
    () => ApiInterceptor(locator<AuthLocalDataSource>(), navigatorKey),
  );
  locator.registerLazySingleton<APIClient>(
    () => APIClient(
      baseUrl: 'https://api.dev.wainfih.com',
      interceptor: locator<ApiInterceptor>(),
    ),
  );

  // Data sources (factories)
  locator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(locator<APIClient>()),
  );
  locator.registerFactory<LookupsRemoteDataSource>(
    () => LookupsRemoteDataSource(locator<APIClient>()),
  );
  locator.registerFactory<ProviderRemoteDataSource>(
    () => ProviderRemoteDataSource(locator<APIClient>()),
  );
  locator.registerFactory<MyProvidersRemoteDataSource>(
    () => MyProvidersRemoteDataSource(locator<APIClient>()),
  );

  // Offline queue (singleton)
  locator.registerLazySingleton<SubmissionQueue>(() => SubmissionQueue());
  locator.registerLazySingleton<QueueManager>(
    () => QueueManager(
      locator<SubmissionQueue>(),
      locator<ProviderRemoteDataSource>(),
      locator<AuthLocalDataSource>(),
    ),
  );
}
