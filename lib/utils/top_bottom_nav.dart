import 'package:flashscore_clone/api/api_service_sportslist.dart';
import 'package:flashscore_clone/customs/sport_selection.dart';
import 'package:flashscore_clone/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashscore_clone/constants/constant.dart';

class MyAppWithBottomNavBar extends StatefulWidget {
  @override
  _SportsListState createState() => _SportsListState();
}

class _SportsListState extends State<MyAppWithBottomNavBar> {
  bool _showSportSelection = false;
  List<dynamic> _sports = [];

  @override
  void initState() {
    super.initState();
    fetchSportsData();
  }

  Future<void> fetchSportsData() async {
    _sports = await ApiService.fetchSportsData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: secondarycolor,
          title: Row(
            children: [
              const Icon(
                IconData(0xe5f2, fontFamily: 'MaterialIcons'),
                size: 40,
                color: nextcolor,
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSportSelection = !_showSportSelection;
                      });
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'SOCCER',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.arrowtriangle_down_fill,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
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
              onPressed: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            const IconButton(
              icon: Icon(
                CupertinoIcons.person_crop_circle,
                size: 30,
                color: nextcolor,
              ),
              onPressed: settingslogin,
            ),
          ],
        ),
        body: const Stack(
          children: [
            MainScreenWithTopNavBar(),
            // SportsSelection(
            //   showSportSelection: _showSportSelection,
            //   sports: _sports,
            // ),
          ],
        ),
      ),
    );
  }
}

// class MainScreenWithTopNavBar extends StatefulWidget {
//   const MainScreenWithTopNavBar({Key? key}) : super(key: key);

//   @override
//   _MainScreenWithTopNavBarState createState() =>
//       _MainScreenWithTopNavBarState();
// }

// class _MainScreenWithTopNavBarState extends State<MainScreenWithTopNavBar> {
//   late PersistentTabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//   }

//   List<Widget> _buildScreens() {
//     return [
//       ToggleDate(),
//       Container(color: Colors.red),
//       Container(color: Colors.blue), // Replace with your screen widget
//       Container(color: Colors.orange[800]),
//       Container(color: Colors.yellow[800]),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.sportscourt),
//         title: ("All Games"),
//         activeColorPrimary: othercolor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.live_tv),
//         title: ("LIVE"),
//         activeColorPrimary: othercolor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.star),
//         title: ("Favourites"),
//         activeColorPrimary: othercolor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.article),
//         title: ("News"),
//         activeColorPrimary: othercolor,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.stacked_bar_chart),
//         title: ("Standings"),
//         activeColorPrimary: othercolor,
//         inactiveColorPrimary: Colors.grey,
//       ),
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
//       backgroundColor: nextcolor, // Overall background color
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

// void settingslogin() {
//   Get.offAndToNamed("/settings_login");
// }
