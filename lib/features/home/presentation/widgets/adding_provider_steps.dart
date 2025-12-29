import 'package:flutter/material.dart';
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
    return Row(
      children: List.generate(_getAddingSteps().length, (index) {
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
              text: _getAddingSteps()[index],
            ),
          ),
        );
      }),
    );
  }

  List<String> _getAddingSteps() => ['التفاصيل', 'الصور', 'الموقع'];
}
