import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/screens/login/LoginBackground.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      Text("aa", textAlign: TextAlign.center,)
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
                  _inputLoginButton(size, context)
                ],
              ),
              Container(height: size.height * 0.1),
              RaisedButton(
                child: Text('signup', style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              Container(height: size.height * 0.05),
            ],
          )
        ],
      )),
    );
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _inputForm(size) => Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 16,
              bottom: 32,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "이메일을 적어주세요";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "비밀번호를 적어주세요";
                      }
                      return null;
                    },
                  ),
                  Container(height: 8),
                  Text("Forgot Password")
                ],
              ),
            ),
          ),
        ),
      );

  Widget _inputLoginButton(size, context) => Positioned(
        left: size.width * 0.2,
        right: size.width * 0.2,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
            child: Text("Login",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              Navigator.pushNamed(context, '/main');
              if (_formKey.currentState.validate()) {
                print(_emailController.text.toString());
              }
            },
          ),
        ),
      );
}
