import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wainfih_data/core/utils/screen_util.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/local_caching/shared_prefs.dart';
import '../../../../core/route/routes.dart';
import '../widgets/home_action_grid.dart';

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
            children: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) async {
                  switch (value) {
                    case 'info':
                      _showUserInfo(context);
                      break;
                    case 'logout':
                      await SharedPrefs.clear();
                      if (context.mounted) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.login,
                          (route) => false,
                        );
                      }
                      break;
                    case 'delete':
                      _showDeleteConfirmation(context);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'info',
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "بيانات المستخدم",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          "تسجيل الخروج",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever_outlined,
                          size: 20,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("حذف الحساب", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Wainfih",
                style: AppTextStyles.bold23.copyWith(color: Colors.white),
              ),
            ],
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

  void _showUserInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("بيانات المستخدم"),
        content: const Text("-------------------------"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إغلاق"),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("حذف الحساب"),
        content: const Text("هل أنت متأكد من رغبتك في حذف الحساب نهائياً؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement delete
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تم إرسال طلب حذف الحساب")),
              );
            },
            child: const Text("حذف", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
