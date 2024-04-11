import 'package:flashscore_clone/constants/constant.dart';
import 'package:flashscore_clone/screens/home_page.dart';
import 'package:flashscore_clone/screens/live_page/live_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreenWithTopNavBar extends StatefulWidget {
  const MainScreenWithTopNavBar({Key? key}) : super(key: key);

  @override
  _MainScreenWithTopNavBarState createState() =>
      _MainScreenWithTopNavBarState();
}

class _MainScreenWithTopNavBarState extends State<MainScreenWithTopNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      ToggleDate(),
      LiveScoresScreen(),
      Container(color: Colors.blue), // Replace with your screen widget
      Container(color: Colors.orange[800]),
      Container(color: Colors.yellow[800]),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.sportscourt),
        title: ("All Games"),
        activeColorPrimary: othercolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.live_tv),
        title: ("LIVE"),
        activeColorPrimary: othercolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.star),
        title: ("Favourites"),
        activeColorPrimary: othercolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.article),
        title: ("News"),
        activeColorPrimary: othercolor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.stacked_bar_chart),
        title: ("Standings"),
        activeColorPrimary: othercolor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: nextcolor, // Overall background color
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style6,
      navBarHeight: 60.0,
      onItemSelected: (index) {
        setState(() {
          _controller.index = index;
        });
      },
    );
  }
}

void settingslogin() {
  Get.offAndToNamed("/settings_login");
}
