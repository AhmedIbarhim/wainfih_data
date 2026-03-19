import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String label;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        labelText: label,
        labelStyle: AppTextStyles.regular11,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }

  OutlineInputBorder _buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}

class CustomPassWordField extends StatefulWidget {
  const CustomPassWordField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<CustomPassWordField> createState() => _CustomPassWordFieldState();
}

class _CustomPassWordFieldState extends State<CustomPassWordField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      label: 'كلمة المرور',
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscure ? Icons.visibility : Icons.visibility_off,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
      ),
    );
  }
}
