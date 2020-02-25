import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/http/RequestResult.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var result;

  loginUser() async {
    result = await http_post("login-user",
        {"id": _idController.text, "password": _passwordController.text});
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
              Container(
                width: double.infinity,
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(),
                  child: Image.asset(
                    'assets/top_background.png',
                    fit: BoxFit.cover,
                    height: size.height * 0.5,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: size.height * 0.08),
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
                children: <Widget>[

                  SizedBox(height: size.height * 0.35),
                  Stack(
                    children: <Widget>[
                      _inputForm(size),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => {
                            //Todo API통신
                            Navigator.pushNamed(context, '/main'),
//                            print('dd'),
//                            if (_formKey.currentState.validate())
//                              {loginUser(), print(loginUser())}
                          },
                      child: SvgPicture.asset('assets/images/signin_btn.svg',
                          fit: BoxFit.cover, width: size.width * 0.9)),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: GestureDetector(
                      child:
                      Text(
                          "비밀번호를 잊으셨나요?",
                          style: const TextStyle(
                              color:  const Color(0xffff7000),
                              fontWeight: FontWeight.w900,
                              fontFamily: "JalnanOTF",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14
                          ),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, '/signUp'),
                    },
                    child: Padding(
                      padding:EdgeInsets.only(top: 50),
                      child: Text(
                          "회원가입",
                          style: const TextStyle(
                              color:  const Color(0xffffa700),
                              fontWeight: FontWeight.w900,
                              fontFamily: "JalnanOTF",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14
                          ),
                          textAlign: TextAlign.center
                      ),
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
