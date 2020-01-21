import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  int pageDepth = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("검색", style: TextStyle(fontSize: 24)),
                onPressed: () {
                  setState((){
                    pageDepth = 1;
                  });
                },
              ),
              Text(pageDepth.toString())
            ],
          ),
        ),
      ),
    );
  }
}

