import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_provider/data/data_sources/provider_remote_data_source.dart';
import '../../features/add_provider/data/repos/provider_submission_repository.dart';
import '../../features/add_provider/presentation/cubit/add_provider_cubit.dart';
import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../features/auth/data/repos/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/lookups/data/data_sources/lookups_remote_data_source.dart';
import '../../features/lookups/data/repos/lookups_repository.dart';
import '../../features/lookups/presentation/cubit/lookups_cubit.dart';
import '../../features/my_providers/data/data_sources/my_providers_remote_data_source.dart';
import '../../features/my_providers/data/models/provider_list_model.dart';
import '../../features/my_providers/data/repos/my_providers_repository.dart';
import '../../features/my_providers/presentation/cubit/my_providers_cubit.dart';
import '../../features/my_providers/presentation/views/my_provider_view.dart';
import '../../features/splash/presentation/splash_view.dart';
import '../di/service_locator.dart';
import '../offline/submission_queue.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(
              AuthRepository(
                locator<AuthRemoteDataSource>(),
                locator<AuthLocalDataSource>(),
              ),
            )..checkSession(),
            child: const SplashView(),
          ),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(
              AuthRepository(
                locator<AuthRemoteDataSource>(),
                locator<AuthLocalDataSource>(),
              ),
            ),
            child: LoginView(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.addProvider:
        // ignore: unused_local_variable
        final provider = settings.arguments as ProviderListModel?;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AddProviderCubit(
                  ProviderSubmissionRepository(locator<ProviderRemoteDataSource>()),
                  locator<SubmissionQueue>(),
                ),
              ),
              BlocProvider(
                create: (_) => LookupsCubit(
                  LookupsRepository(locator<LookupsRemoteDataSource>()),
                )..loadInitialData(),
              ),
            ],
            // TODO: Wire to AddProviderView with provider arg in Task 13
            child: const Placeholder(),
          ),
        );

      case Routes.myProviders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MyProvidersCubit(
              MyProvidersRepository(locator<MyProvidersRemoteDataSource>()),
            )..loadProviders(refresh: true),
            child: const MyProviderView(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
