import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wainfih_data/core/extentions/screen_util.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../adding_new_provider/presentation/widgets/home_action_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          const Expanded(child: HomeActionGrid()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.toHeight,
        bottom: 30.toHeight,
        left: 20.toWidth,
        right: 20.toWidth,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryLightColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Spacer()],
          ),
          SizedBox(height: 20.toHeight),
          CircleAvatar(
            radius: 100.toRadius,
            backgroundColor: Colors.white24,
            child: Padding(
              padding: EdgeInsets.all(16.toRadius),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150.toRadius),
                child: Image.asset(
                  "assets/images/app_icon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "مرحباً بك في لوحة التحكم",
            style: AppTextStyles.bold19.copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.h),
          Text(
            "إدارة مكاتب الخدمات ومقدميها بسهولة",
            style: AppTextStyles.regular13.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
