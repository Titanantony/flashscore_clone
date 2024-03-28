import 'package:flashscore_clone/screens/home_page.dart';
import 'package:flashscore_clone/screens/login.dart';
import 'package:flashscore_clone/utils/top_bottom_nav.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/login", page: () => Login()),
    GetPage(name: "/home", page: () => const MyHomePage()),
    GetPage(name: "/", page: () => MyAppWithBottomNavBar()),
  ];
}
