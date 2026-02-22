import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/screen_util.dart';

class RequestFormDropDown extends StatelessWidget {
  const RequestFormDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validate = true,
    this.onSaved,
  });

  final String? value;
  final String label;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final bool validate;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.toHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.toRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        onSaved: onSaved,
        initialValue: value,
        style: TextStyle(
          fontSize: 12.toFont,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.primaryColor.withValues(alpha: 0.7),
            fontSize: 12.toFont,
            fontWeight: FontWeight.w500,
          ),
          errorStyle: TextStyle(
            fontSize: 10.toFont,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.toRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.toRadius),
            borderSide: BorderSide(
              color: AppColors.basicBorderColor.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.toRadius),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.toRadius),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.toRadius),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.toWidth,
            vertical: 16.toHeight,
          ),
        ),
        items: items,
        onChanged: onChanged,
        validator: validate
            ? (value) => value == null ? 'هذا الحقل مطلوب' : null
            : null,
        dropdownColor: Colors.white,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.primaryColor,
          size: 24.toFont,
        ),
        isExpanded: true,
      ),
    );
  }
}
