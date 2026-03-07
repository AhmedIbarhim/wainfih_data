import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wainfih_data/features/details/presentation/widgets/request_form_drop_down.dart';
import 'package:wainfih_data/features/details/presentation/widgets/request_form_mobile_field.dart';
import 'package:wainfih_data/features/home/domain/provider_model.dart';

import '../widgets/request_form_text_field.dart';

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
                RequestFormTextField(
                  controller: TextEditingController(),
                  label: "اسم مقدم الخدمة",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.nameAr = value,
                ),
                RequestFormDropDown(
                  items: [
                    DropdownMenuItem(value: "1", child: Text("1")),
                    DropdownMenuItem(value: "2", child: Text("2")),
                  ],
                  value: context.read<ProviderModel>().details!.category,
                  onChanged: (value) =>
                      context.read<ProviderModel>().details!.category = value,
                  label: "نوع الخدمة",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.category = value,
                ),
                RequestFormTextField(
                  controller: TextEditingController(),
                  label: "وصف الخدمة",
                  maxLines: 3,
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.description =
                          value,
                ),
                RequestFormMobileField(
                  controller: TextEditingController(),
                  label: "رقم الجوال",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.phone = value,
                ),
                RequestFormTextField(
                  controller: TextEditingController(),
                  label: "البريد الالكتروني",
                  // required: false,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.email = value,
                ),
                RequestFormTextField(
                  controller: TextEditingController(),
                  label: "العنوان",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.address = value,
                ),
                RequestFormTextField(
                  controller: TextEditingController(),
                  label: "المدينة",
                  onSaved: (value) =>
                      context.read<ProviderModel>().details!.city!.cityNameAr =
                          value!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
