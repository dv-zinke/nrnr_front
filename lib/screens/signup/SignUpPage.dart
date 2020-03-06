import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrnr/http/RequestResult.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> _signUpFormkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  var result;

  createUser(BuildContext context) async {
    result = await http_post("auth/local/register", {
      "username": _idController.text,
      "password": _passwordController.text,
      "name": _nameController.text,
      "school": _schoolController.text,
      "email": _emailController.text
    });
    String message = '';
    String failTitle = '회원가입 실패';
    String successTitle = '회원가입 성공';
    if (result['statusCode'] == 404) {
      message = "서버가 연결이 원활하지않습니다.";
      showAlertDialog(context, failTitle,message, false);
    } else if (result['statusCode'] == 400) {
      message = "회원가입 형식에 맞지않습니다.";
      print(result);
      showAlertDialog(context,failTitle, message, false);
    } else if (result['statusCode'] == null) {
      showAlertDialog(context, successTitle,message, true);
    }
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
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  right: 0.0,
                  child:AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back, color: const Color(0xffff664c), size: 40,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: size.width*0.20),
                      child: Text("SIGN UP", style: TextStyle(color: Colors.black87,fontFamily: "JalnanOTF",
                        fontStyle:  FontStyle.normal, letterSpacing: 1.5), ),
                    ),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.15),
                    Stack(
                      children: <Widget>[
                        _inputForm(size),
                      ],
                    ),
                    SizedBox(height:50),
                    Container(
                      child: GestureDetector(
                          onTap: () =>{
                            //Todo API통신
                            if (_signUpFormkey.currentState.validate())
                              {
                                createUser(context),
                              }
                          },
                          child: SvgPicture.asset('assets/images/done.svg', fit: BoxFit.cover, width: size.width*0.8,)
                      ),
                    ),

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
                hintText: "Enter your id",
                labelText: "ID",
                labelStyle: new TextStyle(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.red
                    )
                )
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
          SizedBox(height: 30),
          new TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: new InputDecoration(
                labelText: "Password",
                labelStyle: new TextStyle(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.red
                    )
                )
            ),
            validator: (val) {
              if (val.length == 0) {
                return '비밀번호를 입력해주세요.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 30),
          new TextFormField(
            controller: _nameController,
            decoration: new InputDecoration(
                labelText: "Name",
                labelStyle: new TextStyle(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.red
                    )
                )
            ),
            validator: (val) {
              if (val.length == 0) {
                return '이름을 입력해주세요.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 30),
          new TextFormField(
            controller: _schoolController,
            decoration: new InputDecoration(
                labelText: "school",
                labelStyle: new TextStyle(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.red
                    )
                )
            ),
            validator: (val) {
              if (val.length == 0) {
                return '학교명을 입력해주세요.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 30),
          new TextFormField(
            controller: _emailController,
            decoration: new InputDecoration(
                labelText: "Email",
                labelStyle: new TextStyle(color: const Color(0xFF424242), fontSize: 16, fontWeight: FontWeight.bold),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.red
                    )
                )
            ),
            validator: (val) {
              if (val.length == 0) {
                return '이메일을 입력해주세요.';
              } else {
                bool isValid = EmailValidator.validate(_emailController.text);
                if(!isValid) return '이메일형식에 맞게 입력해주세요.';
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

  void showAlertDialog(BuildContext context, String title, String message, bool isCreate) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('확인'),
              onPressed: () {
                if(isCreate) Navigator.pop(context, '/');
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
