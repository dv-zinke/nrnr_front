import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                // center the children
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    minRadius: 30,
                    backgroundColor: Colors.transparent,
                    child:
                        new Image.asset("assets/images/person_background.png"),
                  ),
                  RaisedButton(
                    child: Text("로그아웃", style: TextStyle(fontSize: 24)),
                    onPressed: () {
                      main();
                    },
                  ),
                  GestureDetector(
                    onTap: () => {print('a')},
                    child: Container(
                      width: size.width * 0.6,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.black12,
                          width: 2.0,
                        ))),
                        child: Text("내 가 쓴 글")),
                  ),
                  GestureDetector(
                    onTap: () => {print('a')},
                    child: Container(
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                ))),
                        child: Text("LOG OUT")),
                  ),
                  GestureDetector(
                    onTap: () => {print('a')},
                    child: Container(
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                ))),
                        child: Text("회원 탈퇴")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void main() async {
    String url = 'https://jsonplaceholder.typicode.com/todos/1';
    var response = await http.get(url);
    print("B");
    Map<String, dynamic> data = jsonDecode(response.body);
    print("A");
    print('status = ${data['userId']}');
  }
}
