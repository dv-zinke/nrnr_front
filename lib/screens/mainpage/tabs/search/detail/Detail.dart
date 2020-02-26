import 'package:flutter/material.dart';
import 'package:nrnr/screens/mainpage/tabs/search/detail/ImageSlider.dart';
class Detail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                // center the children
                children: <Widget>[
                  CarouselWithIndicator(),
                  Text(
                      'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                          'this is sample Flutter app example Code'
                          'Flutter Column Widget scrollable using SingleChildScrollView'
                          'I am just loving Flutter SDK'
                          'Flutter scrollview example using Single Child Scroll View'
                          'flutter fixing bottom overflow by xx pixels in flutter'
                          'Flutter scrollable layout example'
                          'Flutter app SingleChildScrollView Example'
                          'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                          'this is sample Flutter app example Code'
                          'Flutter Column Widget scrollable using SingleChildScrollView'
                          'I am just loving Flutter SDK'
                          'Flutter scrollview example using Single Child Scroll View'
                          'flutter fixing bottom overflow by xx pixels in flutter'
                          'Flutter scrollable layout example'
                          'Flutter app SingleChildScrollView Example ',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
