import 'package:flutter/material.dart';
import 'package:nrnr/screens/initscreen/InitScreen.dart';
import 'package:nrnr/screens/login/LoginPage.dart';
import 'package:nrnr/screens/mainpage/MainPage.dart';
import 'package:nrnr/screens/mainpage/tabs/search/list/List.dart';
import 'package:nrnr/screens/signup/SignUpPage.dart';


class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" :(context)=> InitScreen(),
        "/login": (context)=> LoginPage(),
        "/signUp": (context)=> SignUpPage(),
        "/main" : (context)=> MainPage(),
      },
    );
  }

}
