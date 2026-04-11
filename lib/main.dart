import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/service_locator.dart';
import 'core/offline/queue_manager.dart';
import 'features/auth/data/data_sources/auth_local_data_source.dart';
import 'features/lookups/data/data_sources/lookups_local_data_source.dart';
import 'features/lookups/data/data_sources/lookups_remote_data_source.dart';
import 'features/lookups/presentation/cubit/lookups_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  locator<QueueManager>().startListening();

  // Pre-cache lookups only if user is already logged in
  final isLoggedIn = await locator<AuthLocalDataSource>().isLoggedIn;
  if (isLoggedIn) {
    LookupsCubit(
      locator<LookupsRemoteDataSource>(),
      locator<LookupsLocalDataSource>(),
    ).loadInitialData();
  }

  runApp(const App());
}
