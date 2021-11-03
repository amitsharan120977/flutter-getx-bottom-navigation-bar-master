import 'package:bottom_navigation_flutter/pages/add/add_page.dart';
import 'package:bottom_navigation_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:bottom_navigation_flutter/pages/home/home_controller.dart';
import 'package:bottom_navigation_flutter/pages/home/home_page.dart';
import 'package:bottom_navigation_flutter/pages/messages/messages_controller.dart';
import 'package:bottom_navigation_flutter/pages/messages/messages_page.dart';
import 'package:bottom_navigation_flutter/pages/users/users_controller.dart';
import 'package:bottom_navigation_flutter/pages/users/users_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigation/custom_animated_bottom_bar.dart';

class MyDashBoard extends StatefulWidget {
  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    // Get.put(HomeController());
    // Get.put(MessageController());
    // Get.put(UserController());
    return Obx(() {
      return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            children: [
              HomePage(),
              UsersPage(),
              MessagesPage(),
              AddPage(),
            ],
          )),
          bottomNavigationBar: _buildBottomBar());
    });
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
