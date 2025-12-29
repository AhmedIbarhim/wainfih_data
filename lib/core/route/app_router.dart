import 'package:flutter/material.dart';
import 'package:wainfih_data/features/home/presentation/views/home_view.dart';
import 'package:wainfih_data/features/splash/presentation/splash_view.dart';

import '../../features/home/presentation/views/add_provider_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.addProvider:
        return MaterialPageRoute(builder: (_) => const AddProviderView());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
