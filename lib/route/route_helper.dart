import 'package:flutter/material.dart';
import 'package:video_chat/features/auth/screen/login_page.dart';
import 'package:video_chat/features/auth/screen/otp_screen.dart';
import 'package:video_chat/features/auth/screen/user_info_screen.dart';
import 'package:video_chat/screens/mobile_chat_screen.dart';
import '../common/widget/error_widget.dart';
import '../features/select_contact/screen/select_contact_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: ((context) => const LoginScreen()),
      );
    case OtpSCreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: ((context) => OtpSCreen(
              verificationId: verificationId,
            )),
      );
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
        builder: ((context) => const UserInfoScreen()),
      );

    case SelectContactScreen.routeName:
      return MaterialPageRoute(
        builder: ((context) => const SelectContactScreen()),
      );
    case MobileChatScreen.routeName:
      final argument = settings.arguments as Map<String, dynamic>;
      final name = argument['name'];
      final uid = argument['uid'];
      return MaterialPageRoute(
        builder: ((context) => MobileChatScreen(
              name: name,
              uid: uid,
            )),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            text: 'Page does not Exist',
          ),
        ),
      );
  }
}
