import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wainfih_data/core/components/custom_button.dart';
import 'package:wainfih_data/core/utils/screen_util.dart';

import '../../../../core/local_caching/shared_prefs.dart';
import '../../../../core/route/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              switch (value) {
                case 'info':
                  _showUserInfo(context);
                  break;
                case 'logout':
                  await SharedPrefs.clear();
                  if (context.mounted) {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
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
                    Icon(Icons.person_outline, size: 20, color: Colors.blue),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.r,
              backgroundColor: Colors.grey.shade200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  "assets/images/app_icon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50.toHeight),
            CustomButton(
              text: "إضافة مقدم خدمة جديد",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.addProvider);
              },
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: "عرض مقدمي الخدمة",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.myProviders);
              },
            ),
          ],
        ),
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
