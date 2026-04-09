import 'package:flutter/material.dart';
import 'request_form_drop_down.dart';

class DynamicFieldsDropDown extends StatelessWidget {
  const DynamicFieldsDropDown({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.itemsBuilder,
    this.validate = true,
  });

  final String label;
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> Function(BuildContext context)
  itemsBuilder;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    final items = itemsBuilder(context);
    return RequestFormDropDown(
      value: value,
      label: label,
      items: items,
      onChanged: onChanged,
      validate: validate,
    );
  }
}
