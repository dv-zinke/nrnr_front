import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/http/RequestResult.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var result;

  loginUser(BuildContext context) async {
    result = await http_post("auth/local", {
      "identifier": _idController.text,
      "password": _passwordController.text,
    });
    print(result);
    String errorMessage = '';
    if (result['statusCode'] == 404) {
      errorMessage = "서버가 연결이 원활하지않습니다.";
      showAlertDialog(context, errorMessage);
    } else if (result['statusCode'] == 400) {
      errorMessage = "아이디나 비밀번호가 올바르지 않습니다.";
      showAlertDialog(context, errorMessage);
    } else if (result['statusCode'] == null) {
      Navigator.pushNamed(context, '/main');
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: size.height * 0.1),
                      child: Stack(
                        children: <Widget>[
                          SvgPicture.asset('assets/images/circle.svg'),
                          Padding(
                            padding: EdgeInsets.only(left: 40, top: 40),
                            child: Image.asset(
                              'assets/images/newLogo.png',
                              width: 60,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.35),
                  Stack(
                    children: <Widget>[
                      _inputForm(size),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => {
                            //Navigator.pushNamed(context, '/main'),
//                            print('dd'),
                            if (_formKey.currentState.validate())
                              {loginUser(context)}
                          },
                      child: SvgPicture.asset('assets/images/signin_btn.svg',
                          fit: BoxFit.cover, width: size.width * 0.9)),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: GestureDetector(
                      child: Text("Forgot Password?",
                          style: const TextStyle(
                              color: const Color(0xffff7000),
                              fontWeight: FontWeight.w900,
                              fontFamily: "JalnanOTF",
                              fontStyle: FontStyle.normal,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, '/signUp'),
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text("회원가입",
                          style: const TextStyle(
                              color: const Color(0xffffa700),
                              fontWeight: FontWeight.w900,
                              fontFamily: "JalnanOTF",
                              fontStyle: FontStyle.normal,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                  ),
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
                    hintText: "Enter your id",
                    labelText: "ID",
                    labelStyle: new TextStyle(
                        color: const Color(0xFF424242),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red))),
                validator: (val) {
                  if (val.length == 0) {
                    return '아이디를 입력해주세요.';
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
                obscureText: true,
                controller: _passwordController,
                decoration: new InputDecoration(
                    labelText: "Password",
                    labelStyle: new TextStyle(
                        color: const Color(0xFF424242),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red))),
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

  void showAlertDialog(BuildContext context, String errorMessage) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 실패'),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.pop(context, "확인");
              },
            ),
          ],
        );
      },
    );

    scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text("Result: $result"),
          backgroundColor: Colors.orange,
          action: SnackBarAction(
            label: "Done",
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
  }
}
