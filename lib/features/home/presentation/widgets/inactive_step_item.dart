import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.w,
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: Colors.grey,
          child: Center(
            child: Text(
              '${index + 1}',
              style: AppTextStyles.semiBold13.copyWith(color: Colors.grey),
            ),
          ),
        ),
        Text(text, style: AppTextStyles.semiBold13),
      ],
    );
  }
}
