import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashscore_clone/constants/constant.dart';
import 'package:flashscore_clone/screens/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyAppWithBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: secondarycolor,
          title: const Row(
            children: [
              Icon(
                IconData(0xe5f2, fontFamily: 'MaterialIcons'),
                size: 40,
                color: nextcolor,
              ),
              SizedBox(width: 10),
              Text(
                'My App',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Icon(
                CupertinoIcons.arrowtriangle_down_fill,
                color: nextcolor,
                size: 15,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                CupertinoIcons.search,
                size: 30,
                color: nextcolor,
              ),
              onPressed: () {
                // Handle search action
              },
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.person_crop_circle,
                size: 30,
                color: nextcolor,
              ),
              onPressed: () {
                // Handle more action
              },
            ),
          ],
        ),
        body: MainScreenWithTopNavBar(),
      ),
    );
  }
}

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
      const MyHomePage(),
      Container(color: Colors.red),
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





// import 'package:flashscore_clone/constants/constant.dart';
// import 'package:flashscore_clone/screens/home_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class MyAppp extends StatelessWidget {
//   const MyAppp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   late PersistentTabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//   }

//   List<Widget> _buildScreens() {
//     return [
      
//       Container(color: Colors.red), // Replace with your screen widget
       // Replace with your screen widget
//     ];
//   }

 

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Overall background color
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       navBarStyle: NavBarStyle.style6,
//       navBarHeight: 60.0,
//       onItemSelected: (index) {
//         setState(() {
//           _controller.index = index;
//         });
//       },
//     );
//   }
// }
