// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/components/custom_text_form_field.dart';
// import '../../../../core/components/main_button.dart';
// import '../../../../core/route/routes.dart';
// import '../managers/auth_cubit/auth_cubit.dart';
// import '../managers/auth_cubit/auth_state.dart';
// import 'verification_view.dart';

// class RegisterView extends StatelessWidget {
//   RegisterView({super.key});

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               const Text(
//                 "إنشاء حساب",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "احصل على خدماتك الآن",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               const SizedBox(height: 40),
//               CustomTextFormField(
//                 controller: _nameController,
//                 label: "الاسم",
//                 keyboardType: TextInputType.name,
//               ),
//               const SizedBox(height: 20),
//               CustomTextFormField(
//                 controller: _phoneController,
//                 label: "رقم الجوال",
//                 keyboardType: TextInputType.phone,
//               ),
//               const SizedBox(height: 40),
//               BlocConsumer<AuthCubit, AuthState>(
//                 listener: (context, state) {
//                   if (state is OtpSentSuccess) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const VerificationView(),
//                       ),
//                     );
//                   } else if (state is AuthFailure) {
//                     ScaffoldMessenger.of(
//                       context,
//                     ).showSnackBar(SnackBar(content: Text(state.message)));
//                   }
//                 },
//                 builder: (context, state) {
//                   return MainButton(
//                     text: "إنشاء حساب",
//                     isLoading: state is AuthLoading,
//                     onTap: () {
//                       // final name = _nameController.text.trim();
//                       // final phone = _phoneController.text.trim();
//                       // if (name.isNotEmpty && phone.isNotEmpty) {
//                       //   context.read<AuthCubit>().register(
//                       //     mobileNumber: phone,
//                       //     username: name,
//                       //   );
//                       // }

//                       Navigator.pushReplacementNamed(context, Routes.login);
//                     },
//                   );
//                 },
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("لديك حساب بالفعل؟"),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, Routes.login);
//                     },
//                     child: const Text(
//                       "تسجيل الدخول",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
