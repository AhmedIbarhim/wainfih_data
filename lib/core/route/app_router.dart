import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wainfih_data/features/home/presentation/views/home_view.dart';
import 'package:wainfih_data/features/splash/presentation/splash_view.dart';
import 'package:wainfih_data/features/auth/presentation/views/login_view.dart';
import 'package:wainfih_data/features/auth/presentation/views/register_view.dart';
import 'package:wainfih_data/features/auth/presentation/views/verification_view.dart';
import 'package:wainfih_data/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import '../../features/home/domain/provider_model.dart';
import '../../features/home/presentation/views/add_provider_view.dart';
import '../../features/my_providers/presentation/views/my_provider_view.dart';
import '../di/service_locator.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<AuthCubit>(),
            child: LoginView(),
          ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<AuthCubit>(),
            child: RegisterView(),
          ),
        );

      case Routes.verification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<AuthCubit>(),
            child: const VerificationView(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.addProvider:
        return MaterialPageRoute(
          builder: (_) => AddProviderView(
            providerModel: settings.arguments as ProviderModel?,
          ),
        );

      case Routes.myProviders:
        return MaterialPageRoute(builder: (_) => const MyProviderView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
