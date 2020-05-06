import 'package:a05/Profile/ProfileView.dart';
import 'package:a05/UI/addKidView.dart';
import 'package:a05/UI/createAccount.dart';
import 'package:a05/UI/login.dart';
import 'package:flutter/material.dart';
import 'package:a05/assets/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/CategoryList.dart';
import 'assets/colors.dart';
import 'Activity/ActivityView.dart';
import "Home/Home.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}


class MyApp extends StatelessWidget {

  final SharedPreferences prefs;

  MyApp({this.prefs});
  // This widget is the root of your application.
  // final Map<int, Color> swatch = {
  //   50: Color.fromRGBO(179, 24, 48, 0.1),
  //   100: Color.fromRGBO(179, 24, 48, 0.2),
  //   200: Color.fromRGBO(179, 24, 48, 0.3),
  //   300: Color.fromRGBO(179, 24, 48, 0.4),
  //   400: Color.fromRGBO(179, 24, 48, 0.5),
  //   500: Color.fromRGBO(179, 24, 48, 0.6),
  //   600: Color.fromRGBO(179, 24, 48, 0.7),
  //   700: Color.fromRGBO(179, 24, 48, 0.8),
  //   800: Color.fromRGBO(179, 24, 48, 0.9),
  //   900: Color.fromRGBO(179, 24, 48, 1)
  // };
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A05',
        theme: ThemeData(
          // This is the theme of your application.
          // primarySwatch: MaterialColor(0xffb31830, swatch),
          scaffoldBackgroundColor: $secondary,
        ),
        initialRoute: _defInitialRoute(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => Home(),
          '/activity': (BuildContext context) => ActivityView(),
          '/profile' : (BuildContext context) => ProfileView(),
          '/search' :(BuildContext context) => CategoryList(),
          '/login' : (BuildContext context) => Login(),
          '/createAccount' : (BuildContext context) => CreateAccount(),
          '/addKid' : (BuildContext context) => AddKidView(),
          
        },
      ),
    );
  }


  String _defInitialRoute() {
    if(prefs.containsKey("user_id")) {
      print("Starting with user logged in");
      return "/home";
    } else {
      print("Starting without user login, login view loaded");
      return "/login";
    }
  }
}


