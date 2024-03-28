import 'package:flashscore_clone/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Persistent Bottom Nav Bar Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const MyHomePage(),
      Container(color: Colors.red), // Replace with your screen widget
      Container(color: Colors.green),
      Container(color: Colors.blue), // Replace with your screen widget
      Container(color: Colors.green), // Replace with your screen widget
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.sportscourt),
        title: ("All Games"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.live_tv),
        title: ("LIVE"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.star),
        title: ("Favourites"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.article),
        title: ("News"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.stacked_bar_chart),
        title: ("Standings"),
        activeColorPrimary: Colors.blue,
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
      backgroundColor: Colors.white, // Overall background color
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
