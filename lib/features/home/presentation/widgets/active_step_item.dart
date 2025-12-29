import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.w,
      children: [
        CircleAvatar(
          radius: 11.5.r,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.check, color: Colors.white),
        ),
        Text(
          text,
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
