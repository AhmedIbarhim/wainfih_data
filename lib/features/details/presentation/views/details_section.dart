import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wainfih_data/core/components/custom_text_form_field.dart';
import 'package:wainfih_data/features/home/domain/provider_model.dart';

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
                CustomTextFormField(
                  label: "الاسم",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.name = value,
                ),
                CustomTextFormField(
                  label: "نوع الخدمة",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.category = value,
                ),
                CustomTextFormField(
                  label: "وصف الخدمة",
                  maxLines: 3,
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.description =
                          value,
                ),
                CustomTextFormField(
                  label: "رقم الجوال",
                  keyboardType: TextInputType.phone,
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.phone = value,
                ),
                CustomTextFormField(
                  label: "البريد الالكتروني",
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.email = value,
                ),
                CustomTextFormField(
                  label: "العنوان",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.address = value,
                ),
                CustomTextFormField(
                  label: "المدينة",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.city = value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
