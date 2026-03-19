import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/main_button.dart';
import '../../../../core/route/routes.dart';
import '../managers/auth_cubit/auth_cubit.dart';
import '../managers/auth_cubit/auth_state.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "أهلاً بك مجدداً",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "أدخل رقم جوالك لتسجيل الدخول",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                controller: _phoneController,
                label: "رقم الجوال",
                suffixIcon: const Icon(Icons.phone_android),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 40),
              CustomPassWordField(controller: _passwordController),
              const SizedBox(height: 80),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is OtpSentSuccess) {
                    Navigator.pushNamed(context, Routes.verification);
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    text: "تسجيل الدخول",
                    isLoading: state is AuthLoading,
                    onTap: () {
                      // final phone = _phoneController.text.trim();
                      // if (phone.isNotEmpty) {
                      //   context.read<AuthCubit>().sendOtp(phone);
                      // }

                      Navigator.pushReplacementNamed(context, Routes.home);
                    },
                  );
                },
              ),
              // const Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text("ليس لديك حساب؟"),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.pushReplacementNamed(context, Routes.register);
              //       },
              //       child: const Text(
              //         "إنشاء حساب",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
