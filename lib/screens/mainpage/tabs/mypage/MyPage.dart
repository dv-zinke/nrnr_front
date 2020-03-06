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
                  SizedBox(height: 100,),
                  Container(
                    width: size.width * 0.7,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          minRadius: 30,
                          backgroundColor: Colors.transparent,
                          child:
                              new Image.asset("assets/images/person_background.png"),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:20),
                              child: Text("테스터", style:TextStyle(fontSize: 30)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:20),
                              child: Text("EDIT PROFILE", style:TextStyle(fontSize: 16,color: const Color(0xffff664c), fontWeight: FontWeight.w900)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () => {print('a')},
                    child: Container(
                      width: size.width * 0.7,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.black12,
                          width: 2.0,
                        ))),
                        child:Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child:Text("내 가 쓴 글", style:TextStyle(fontSize: 18,color: const Color(0xffff664c), fontWeight: FontWeight.w900)),))
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                      onTap: () => {Navigator.of(context).pop()},
                      child: Container(
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ))),
                          child:Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child:Text("LOG OUT", style:TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w900)),))
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                      onTap: () => {print('a')},
                      child: Container(
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ))),
                          child:Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child:Text("회원탈퇴", style:TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w900)),))
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
    Map<String, dynamic> data = jsonDecode(response.body);
    print('status = ${data['userId']}');
  }
}
