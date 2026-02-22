import 'package:get_it/get_it.dart';
import 'package:wainfih_data/features/auth/data/repos/auth_repo.dart';

import '../../features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import '../networking/api_service.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<APIService>(
    () => APIService(baseUrl: 'https://wainfih.com/api'),
  );

  locator.registerLazySingleton<AuthRepo>(
    () => AuthRepo(locator<APIService>()),
  );

  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(locator<AuthRepo>()),
  );
}
