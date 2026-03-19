import 'package:flutter/material.dart';
import 'active_step_item.dart';
import 'inactive_step_item.dart';

class StepItemSwitcher extends StatelessWidget {
  const StepItemSwitcher(
      {super.key,
      required this.text,
      required this.index,
      required this.isActive});
  final String text;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: InactiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(text: text),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}
