import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wainfih_data/core/components/custom_text_form_field.dart';

class DetailsSection extends StatefulWidget {
  const DetailsSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: widget.valueListenable,
      builder: (context, value, child) {
        return Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                const SizedBox(height: 40),
                CustomTextFormField(label: "الاسم"),
                CustomTextFormField(label: "نوع الخدمة"),
                CustomTextFormField(label: "وصف الخدمة"),
                CustomTextFormField(label: "رقم الجوال"),
                CustomTextFormField(label: "البريد الالكتروني"),
                CustomTextFormField(label: "العنوان"),
                CustomTextFormField(label: "المدينة"),
              ],
            ),
          ),
        );
      },
    );
  }
}
