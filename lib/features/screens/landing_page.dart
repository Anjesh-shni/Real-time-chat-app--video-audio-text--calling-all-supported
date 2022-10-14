import 'package:flutter/material.dart';
import 'package:video_chat/colors.dart';
import 'package:video_chat/features/auth/screen/login_page.dart';

import '../../common/widget/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome to Chats Apps",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            Image.asset(
              "assets/wow.jpeg",
              width: double.maxFinite,
              height: 340,
              // height: 340,
            ),
            SizedBox(
              height: size.height / 6,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Read our Privacy Policy. Tap "agree and continue" to accept Terms and Services.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: "AGREE AND CONTINUE",
                onpressed: () {
                  navigateToLoginScreen(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
