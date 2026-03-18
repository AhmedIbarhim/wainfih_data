import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/extentions/screen_util.dart';

class RequestFormMobileField extends StatefulWidget {
  const RequestFormMobileField({
    super.key,
    required this.controller,
    required this.label,
    this.onSaved,
  });

  final TextEditingController controller;
  final String label;
  final void Function(String?)? onSaved;

  @override
  State<RequestFormMobileField> createState() => _RequestFormMobileFieldState();
}

class _RequestFormMobileFieldState extends State<RequestFormMobileField> {
  late TextEditingController displayController;

  @override
  void initState() {
    super.initState();
    displayController = TextEditingController();
    if (widget.controller.text.isEmpty) {
      widget.controller.text = "+966";
    } else if (!widget.controller.text.startsWith("+966")) {
      widget.controller.text = "+966" + widget.controller.text;
    }
    displayController.text = widget.controller.text.substring(4);
    displayController.addListener(() {
      widget.controller.text = "+966" + displayController.text;
    });
  }

  @override
  void dispose() {
    displayController.dispose();
    super.dispose();
  }

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
      child: TextFormField(
        controller: displayController,
        keyboardType: TextInputType.phone,
        onSaved: widget.onSaved,
        validator: (value) {
          final fullValue = "+966" + (value ?? "");
          if (value!.isEmpty) {
            return 'هذا الحقل مطلوب';
          } else if (fullValue.length < 13) {
            return 'الرجاء إدخال رقم هاتف صحيح';
          }
          return null;
        },
        textAlign: TextAlign.left,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(9),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(fontSize: 12.toFont, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: AppColors.primaryColor.withValues(alpha: 0.7),
            fontSize: 12.toFont,
            fontWeight: FontWeight.w500,
          ),
          errorStyle: TextStyle(
            fontSize: 10.toFont,
            fontWeight: FontWeight.w600,
          ),
          suffixIcon: _KSAPrefix(),
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
      ),
    );
  }
}

class _KSAPrefix extends StatelessWidget {
  const _KSAPrefix();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.toWidth),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 8.toWidth),
          Container(
            height: 20.toHeight,
            width: 1,
            color: AppColors.basicBorderColor.withValues(alpha: 0.5),
          ),
          SizedBox(width: 8.toWidth),
          Text(
            '966+' + generateCountryFlag(),
            style: TextStyle(
              fontSize: 12.toFont,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = 'sa';

    String flag = countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );

    return flag;
  }
}
