import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_chat/colors.dart';
import 'package:video_chat/common/widget/small_text.dart';
import 'package:video_chat/features/auth/controller/auth_controller.dart';

class OtpSCreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String verificationId;
  const OtpSCreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvidr).verifyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        title: const Text(
          "Verifying your number",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: SmallTxt(
              text: "we have sent an SMS with code",
              color: Colors.grey,
              size: 16,
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "- - - - - -",
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOTP(
                    ref,
                    context,
                    value.trim(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
