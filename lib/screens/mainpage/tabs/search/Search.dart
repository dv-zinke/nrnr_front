import 'package:flutter/material.dart';
import 'package:nrnr/screens/mainpage/tabs/search/detail/Detail.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  bool isSearch = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        if (!isSearch)
          Container(
            child: Center(
              child: Column(
                // center the children
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _inputForm(size),
                  RaisedButton(
                    child: Text("검색", style: TextStyle(fontSize: 24)),
                    onPressed: () {
                      setState(() {
                        isSearch = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        if (isSearch) Detail()
      ]),
    );
  }

  Widget _inputForm(size) => Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new TextFormField(
                controller: _idController,
                decoration: new InputDecoration(
                  labelText: "지역",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return null;
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              new TextFormField(
                controller: _passwordController,
                decoration: new InputDecoration(
                  labelText: "기간",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.vpn_key),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return null;
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              new TextFormField(
                controller: _passwordController,
                decoration: new InputDecoration(
                  labelText: "가격",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.vpn_key),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return null;
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              new TextFormField(
                controller: _passwordController,
                decoration: new InputDecoration(
                  labelText: "방 종류",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.vpn_key),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return '비밀번호를 입력해주세요';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
      );
}
