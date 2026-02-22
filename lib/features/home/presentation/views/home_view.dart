import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wainfih_data/core/components/custom_button.dart';
import 'package:wainfih_data/core/utils/screen_util.dart';

import '../../../../core/route/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
}
