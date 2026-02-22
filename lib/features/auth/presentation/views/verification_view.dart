import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/components/main_button.dart';
import '../../../../core/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../managers/auth_cubit/auth_cubit.dart';
import '../managers/auth_cubit/auth_state.dart';
import '../widgets/resend_verification_button.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorF8F8F8,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.basicBorderColor),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "تفعيل الحساب",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "أدخل رمز التحقق المرسل إلى جوالك",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Pinput(
                    length: 4,
                    controller: _codeController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: Colors.red),
                      ),
                    ),
                    validator: (s) {
                      return s?.length == 4 ? null : "يرجى إدخال الرمز كاملاً";
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(height: 40),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم التحقق بنجاح")),
                      );
                      Navigator.popUntil(context, (route) => route.isFirst);
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return MainButton(
                      text: "تأكيد",
                      isLoading: state is AuthLoading,
                      onTap: () {
                        // if (_formKey.currentState?.validate() ?? false) {
                        //   context.read<AuthCubit>().verifyOtp(
                        //     _codeController.text,
                        //   );
                        // }

                        Navigator.pushNamed(context, Routes.home);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Center(child: ResendVerificationButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
