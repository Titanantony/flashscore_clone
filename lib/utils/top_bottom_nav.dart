import 'package:flashscore_clone/api/api_service_sportslist.dart';
import 'package:flashscore_clone/customs/sport_selection.dart';
import 'package:flashscore_clone/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashscore_clone/constants/constant.dart';
import 'package:flashscore_clone/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
        body: Stack(
          children: [
            MainScreenWithTopNavBar(),
            SportsSelection(
              showSportSelection: _showSportSelection,
              sports: _sports,
            ),
          ],
        ),
      ),
    );
  }
}
