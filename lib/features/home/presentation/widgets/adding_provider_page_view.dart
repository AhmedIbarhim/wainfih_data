import 'package:flutter/material.dart';
import 'package:wainfih_data/features/home/presentation/views/details_section.dart';
import 'package:wainfih_data/features/home/presentation/views/image_section.dart';
import 'package:wainfih_data/features/home/presentation/views/location_section.dart';

class AddingProviderPageView extends StatelessWidget {
  const AddingProviderPageView({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: _addingSteps().length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _addingSteps()[index],
      ),
    );
  }

  List<Widget> _addingSteps() => [
    const DetailsSection(),
    const ImageSection(),
    const LocationSection(),
  ];
}
