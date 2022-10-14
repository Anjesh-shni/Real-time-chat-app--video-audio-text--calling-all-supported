import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_chat/common/widget/error_widget.dart';
import 'package:video_chat/features/auth/controller/auth_controller.dart';
import 'package:video_chat/features/screens/landing_page.dart';
import 'package:video_chat/firebase_options.dart';
import 'package:video_chat/route/route_helper.dart';

import 'package:video_chat/screens/mobile_layout_screen.dart';
import 'common/widget/loader.dart';

void main() async {
  //works like glue that bind flutter framework with flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Chat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff34495E),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                text: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }
}
