import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'step_item_switcher.dart';

class AddingProviderSteps extends StatelessWidget {
  const AddingProviderSteps({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final steps = _getAddingSteps(context);
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (index <= currentIndex) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              }
            },
            child: StepItemSwitcher(
              isActive: index <= currentIndex,
              index: index,
              text: steps[index],
            ),
          ),
        );
      }),
    );
  }

  List<String> _getAddingSteps(BuildContext context) {
    final l = S.of(context);
    return [l.stepBasicInfo, l.stepPhotoAndLocation, l.stepClassification];
  }
}
