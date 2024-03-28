import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flashscore_clone/constants/constant.dart';
import 'package:flashscore_clone/constants/navText.dart';
import 'package:flashscore_clone/customs/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Flutter Mapp',
            textcolor: nextcolor,
          ),

          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: nextcolor,
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: secondarycolor,
          leading: IconButton(
              onPressed: () {},
              icon: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: nextcolor,
                ),
                onPressed: () {},
              )),
          // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(25),
          //   bottomRight: Radius.circular(25),
          // )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                  color: primarycolor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: "fruit"),
                        Image.asset(
                          "assets/images/grape.png",
                          // height: 100,
                          // width: 100,
                        ),
                        const CustomText(text: "grapes")
                      ]));
            },
          ),
        ));
  }
}



        // bottomNavigationBar: CurvedNavigationBar(
        //   color: primarycolor,
        //   backgroundColor: nextcolor,
        //   buttonBackgroundColor: othercolor,
        //   items: const [
        //     NavText(
        //       icon: CupertinoIcons.sportscourt,
        //       text: "All Games",
        //     ),
        //     NavText(
        //         icon: CupertinoIcons.dot_radiowaves_left_right, text: "LIVE"),
        //     NavText(icon: CupertinoIcons.star, text: "Favourites"),
        //     NavText(icon: CupertinoIcons.news_solid, text: "News"),
        //     NavText(icon: CupertinoIcons.flowchart, text: "Standinngs"),

        //     // _buildIconWithText(CupertinoIcons.sportscourt, "All Games"),
        //     // Icon(CupertinoIcons.dot_radiowaves_left_right),
        //     // Icon(CupertinoIcons.star),
        //     // Icon(CupertinoIcons.news_solid),
        //     // Icon(CupertinoIcons.flowchart)
        //   ],
        // ),
