import 'package:flutter/material.dart';
import 'package:wainfih_data/core/components/custom_button.dart';
import 'package:wainfih_data/features/home/presentation/widgets/adding_provider_steps.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../widgets/adding_provider_page_view.dart';

class AddProviderView extends StatefulWidget {
  const AddProviderView({super.key});

  @override
  State<AddProviderView> createState() => _AddProviderViewState();
}

class _AddProviderViewState extends State<AddProviderView> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "اضافة مقدم خدمة جديد"),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AddingProviderSteps(
              currentIndex: currentIndex,
              pageController: pageController,
            ),
            const SizedBox(height: 20),
            AddingProviderPageView(
              pageController: pageController,
              formKey: formKey,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: _getButtonText(),
              onPressed: () {
                {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  String _getButtonText() {
    if (currentIndex == 2) {
      return "حفظ";
    } else {
      return "التالي";
    }
  }
}
