import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {

  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownExample(),
            Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: signUpForm,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                    ),
                    TextFormField(
                      controller: _passwordController,
                    ),
                    TextFormField(
                      controller: _schoolController,
                    ),
                    RaisedButton(
                      child: Text("회원가입fdijk4", style: TextStyle(fontSize: 24)),
                      onPressed: () {
                        print(
                          _emailController.text
                        );
                        //Navigator.pushNamed(context, '/login');
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );

  }
}



class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('Item 1'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Item 2'),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text('Item 3'),
            value: 'three',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Select Item'),
        value: _value,
      ),
    );
  }
}
