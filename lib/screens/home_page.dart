import 'package:flashscore_clone/constants/constant.dart';
import 'package:flashscore_clone/customs/custom_text.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
