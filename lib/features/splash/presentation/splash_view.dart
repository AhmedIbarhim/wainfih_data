import 'package:flutter/material.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';
import 'package:wainfih_data/core/utils/assets.dart';

import '../../../core/route/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Image.asset(Assets.appIcon)),
    );
  }
}
