import 'package:flutter/material.dart';
import 'package:wainfih_data/core/components/custom_button.dart';
import 'package:wainfih_data/features/home/domain/provider_model.dart';
import 'package:wainfih_data/features/home/presentation/widgets/adding_provider_steps.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/custom_snack_bar.dart';
import '../../../../core/helpers/handle_location_permission.dart';
import '../widgets/adding_provider_page_view.dart';
import 'package:provider/provider.dart';

class AddProviderView extends StatefulWidget {
  const AddProviderView({super.key});

  @override
  State<AddProviderView> createState() => _AddProviderViewState();
}

class _AddProviderViewState extends State<AddProviderView> {
  ProviderModel providerModel = ProviderModel(images: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: "اضافة مقدم خدمة جديد"),
      body: Provider.value(value: providerModel, child: _Body()),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    super.initState();
    handleLocationPermission(context);
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
    valueNotifier.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            valueListenable: valueNotifier,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: _getButtonText(),
            onPressed: () {
              {
                if (currentIndex == 0) {
                  _handleDetailsInputValidation();
                } else if (currentIndex == 1) {
                  _handleImagesValidation();
                } else {
                  _submitRequest();
                }
              }
            },
          ),
          const SizedBox(height: 30),
        ],
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

  void _moveToNextStep() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void _handleDetailsInputValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _moveToNextStep();
    } else {
      valueNotifier.value = AutovalidateMode.onUserInteraction;
    }
  }

  void _handleImagesValidation() {
    if (context.read<ProviderModel>().images!.isEmpty) {
      showErrorSnackBar(context, "يجب اضافة صورة");
      return;
    } else {
      _moveToNextStep();
    }
  }

  void _submitRequest() {
    // To Handle submit Later

    Navigator.pop(context);
  }
}
