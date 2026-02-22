import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../managers/auth_cubit/auth_cubit.dart';
import '../managers/auth_cubit/auth_state.dart';

class ResendVerificationButton extends StatefulWidget {
  const ResendVerificationButton({super.key});

  @override
  State<ResendVerificationButton> createState() =>
      _ResendVerificationButtonState();
}

class _ResendVerificationButtonState extends State<ResendVerificationButton> {
  late int _endTime;
  final int _resendTime = 60;

  @override
  void initState() {
    _resetTimer();
    super.initState();
  }

  void _resetTimer() {
    setState(() {
      _endTime = DateTime.now()
          .add(Duration(seconds: _resendTime))
          .millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is OtpResentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("تم إعادة إرسال الرمز")));
          _resetTimer();
        }
      },
      child: CountdownTimer(
        endTime: _endTime,
        widgetBuilder: (_, CurrentRemainingTime? time) {
          if (time == null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("لم تستلم الرمز؟"),
                TextButton(
                  onPressed: () {
                    context.read<AuthCubit>().resendOtp();
                  },
                  child: const Text(
                    "إعادة إرسال",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("إعادة إرسال الكود خلال "),
              Text(
                "${time.min ?? 0}:${(time.sec ?? 0).toString().padLeft(2, '0')}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
