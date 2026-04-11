import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';
import 'package:wainfih_data/core/utils/assets.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/route/routes.dart';
import '../../auth/presentation/cubit/auth_cubit.dart';
import '../../auth/presentation/cubit/auth_state.dart';
import '../../lookups/data/data_sources/lookups_local_data_source.dart';
import '../../lookups/data/data_sources/lookups_remote_data_source.dart';
import '../../lookups/presentation/cubit/lookups_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // Refresh lookups cache
          LookupsCubit(
            locator<LookupsRemoteDataSource>(),
            locator<LookupsLocalDataSource>(),
          ).loadInitialData();
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.home,
            (route) => false,
          );
        } else if (state is AuthLoggedOut) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.appIcon),
              const SizedBox(height: 24),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
