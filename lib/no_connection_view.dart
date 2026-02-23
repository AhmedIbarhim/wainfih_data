import 'package:flutter/material.dart';
import 'package:wainfih_data/core/theme/app_colors.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent back button
      onPopInvokedWithResult: (didPop, result) {
        // Handle logic if needed when a pop is attempted
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 200,
                color: AppColors.primaryLightColor.withValues(alpha: 0.5),
              ),
              Text(
                "لا يوجد اتصال بالانترنت",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
