import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/http/http.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool response = true;

  loginUser() async {
    var result = await http_post("login-user", {
      "id": _idController.text,
      "password": _passwordController.text
    });
    response = result.data['status'];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SvgPicture.asset('assets/top_background.svg',
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height * 0.5),
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.2),
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset('assets/images/circle.svg'),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset('assets/images/logo.png'),
                      )
                    ],
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _inputForm(size),
                ],
              ),
              GestureDetector(
                  onTap: () => {
                    //Todo API통신
                        if (_formKey.currentState.validate())
                          {
                            loginUser(),
                            print("id = " +
                                _idController.text.toString() +
                                "\n" +
                                "password = " +
                                _passwordController.text.toString()),
                                print(response)
                            // Navigator.pushNamed(context, '/main'),
                          }
                      },
                  child: SvgPicture.asset('assets/images/signin_btn.svg',
                      fit: BoxFit.cover, width: size.width * 0.9)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, '/signUp'),
                },
                child: Text("회원가입"),
              ),
              Container(height: size.height * 0.3),
            ],
          )
        ],
      )),
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
                  labelText: "ID",
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

                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              new TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: new InputDecoration(
                  labelText: "Password",
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
                    return;
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
