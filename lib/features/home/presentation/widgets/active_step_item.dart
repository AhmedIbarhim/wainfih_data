import 'package:flutter/material.dart';
import '../../../../Core/utils/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/screen_util.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.toWidth,
      children: [
        CircleAvatar(
          radius: 11.5.toRadius,
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
