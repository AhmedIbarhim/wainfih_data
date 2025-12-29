import 'package:flutter/material.dart';
import 'package:wainfih_data/core/components/custom_button.dart';

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
            CustomButton(
              text: "إضافة مقدم خدمة جديد",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.addProvider);
              },
            ),
            const SizedBox(height: 40),
            CustomButton(text: "عرض مقدمي الخدمة", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
