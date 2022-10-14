import 'package:flutter/material.dart';

import 'package:video_chat/utils/responsive_layout.dart';

import '../../features/auth/screen/user_info_screen.dart';
import '../../features/screens/landing_page.dart';
import '../mobile_layout_screen.dart';
import '../web_layout_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const ResponsiveLayout(
      mobileScreenLayout: MobileLayoutScreen(),
      webScreenLayout: WebLayoutScreen(),
    ),
    const LandingScreen(),
    const UserInfoScreen(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "Status",
          ),
        ],
      ),
    );
  }
}
