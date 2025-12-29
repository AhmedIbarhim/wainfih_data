import 'package:flutter/material.dart';
import 'package:wainfih_data/core/components/custom_text_form_field.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 40),
            CustomTextFormField(label: "الاسم"),
            CustomTextFormField(label: "نوع الخدمة"),
            CustomTextFormField(label: "رقم الجوال"),
            CustomTextFormField(label: "البريد الالكتروني"),
            CustomTextFormField(label: "العنوان"),
            CustomTextFormField(label: "المدينة"),
          ],
        ),
      ),
    );
  }
}
