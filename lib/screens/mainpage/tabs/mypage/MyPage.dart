import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                minRadius: 30,
                backgroundColor: Colors.transparent,
                child:  new Image.asset("assets/images/person_background.png"),
              ),
              RaisedButton(
                child: Text("로그아웃", style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
