import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/http/RequestResult.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> _signUpFormkey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  var result;

  createUser() async {
    result = await http_post("create-user", {
      "id": _idController.text,
      "password": _passwordController.text,
      "name": _schoolController.text,
      "school": _nameController.text,
      "emailAddress": _emailController.text
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Stack(
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
                Positioned(
                  top: 10.0,
                  left: 0.0,
                  right: 0.0,
                  child:AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.black87),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                    ),
                  )
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
                              padding: EdgeInsets.only(top:50, left:25),
                              child:   Text(
                                  "회원가입",
                                  style: const TextStyle(
                                      color:  const Color(0xffffffff),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "JalnanOTF",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 26
                                  ),
                              )
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
                          if (_signUpFormkey.currentState.validate())
                            {
                              createUser(),
                              print(createUser() + "11"),
                              print("id = " +
                                  _idController.text.toString() +
                                  "\n" +
                                  "password = " +
                                  _passwordController.text.toString() +
                                  "\n" +
                                  "name = " +
                                  _nameController.text.toString() +
                                  "\n" +
                                  "school = " +
                                  _schoolController.text.toString() +
                                  "\n" +
                                  "email = " +
                                  _emailController.text.toString())
                              // Navigator.pushNamed(context, '/main'),
                            }
                        },
                        child: Image.asset('assets/images/signup.png')),
                    SizedBox(height: size.height * 0.04)
                  ],

                )
              ],
            ),
          )),
    );
  }

  Widget _inputForm(size) => Padding(
    padding: EdgeInsets.all(size.width * 0.05),
    child: Form(
      key: _signUpFormkey,
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
          SizedBox(height: 20),
          new TextFormField(
            controller: _nameController,
            decoration: new InputDecoration(
              labelText: "name",
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.account_circle),
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
          SizedBox(height: 20),
          new TextFormField(
            controller: _schoolController,
            decoration: new InputDecoration(
              labelText: "school",
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.school),
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
          SizedBox(height: 20),
          new TextFormField(
            controller: _emailController,
            decoration: new InputDecoration(
              labelText: "email",
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.email),
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
            keyboardType: TextInputType.emailAddress,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    ),
  );
}
