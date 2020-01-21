import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(1.0000000000000004, 0),
                    end: Alignment(0, 1.0000000000000002),
                    colors: [
                  const Color(0xffffc800),
                  const Color(0xffff4500),
                  const Color(0xffff0000)
                ]))),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 60,
                      child: Icon(Icons.home, color: Colors.white, size: 60.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('로그인', style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                        RaisedButton(
                          child: Text("회원가입1", style: TextStyle(fontSize: 24)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUp');
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
