import 'package:flutter/material.dart';
import 'package:wainfih_data/Core/utils/app_text_styles.dart';

import '../../../../core/components/custom_app_bar.dart';

class MyProviderView extends StatelessWidget {
  const MyProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "مقدمي الخدمة الخاصة بي"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "لم يتم إضافة مقدمي خدمة بعد",
              style: AppTextStyles.semiBold16,
            ),
          ],
        ),
      ),
    );
  }
}
