import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SvgPicture.asset('assets/images/background.svg', fit: BoxFit.cover),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Image.asset('assets/images/logo.png'),
                        Padding(
                          padding:EdgeInsets.only(top: 90),
                          child: Image.asset('assets/images/logo_text.png'),
                        )
                      ],
                    ),

                    Container(height: size.height * 0.30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: GestureDetector(
                            onTap: () =>{ Navigator.pushNamed(context, '/login')},
                            child: SvgPicture.asset('assets/images/loginButton.svg', fit: BoxFit.cover, width: size.width*0.8)
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20),),
                        Container(
                          child: GestureDetector(
                              onTap: () =>{ Navigator.pushNamed(context, '/signUp')},
                              child: SvgPicture.asset('assets/images/signupButton.svg', fit: BoxFit.cover, width: size.width*0.8,)
                          ),
                        ),
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
