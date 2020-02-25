import 'package:flutter/material.dart';
import 'package:flutter_candies_demo_library/flutter_candies_demo_library.dart';
import 'package:nrnr/screens/initscreen/InitScreen.dart';
import 'package:nrnr/screens/login/LoginPage.dart';
import 'package:nrnr/screens/login/Test.dart';
import 'package:nrnr/screens/mainpage/MainPage.dart';
import 'package:nrnr/screens/mainpage/tabs/search/list/List.dart';
import 'package:nrnr/screens/signup/SignUpPage.dart';


class Routes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:(c,w){
        ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
        return w;
      },
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
