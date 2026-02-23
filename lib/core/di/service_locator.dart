import 'package:get_it/get_it.dart';
import 'package:wainfih_data/features/auth/data/repos/auth_repo.dart';

import '../../features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import '../networking/api_client.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<APIClient>(
    () => APIClient(baseUrl: 'https://wainfih.com/api'),
  );

  locator.registerLazySingleton<AuthRepo>(() => AuthRepo(locator<APIClient>()));

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(locator<AuthRepo>()),
  );
}
