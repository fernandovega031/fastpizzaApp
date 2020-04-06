import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/welcome/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fastpizzaapp/register/register_screen.dart';

class WelcomeRegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ButtonTheme(
        minWidth: 350.0,
        height: 45.0,
        padding: new EdgeInsets.all(0.0),
        child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          }),
        );
      },
      child: Text('Create Account', style: TextStyle(color: Colors.black)),
      color: Colors.white,
    ),
      );
  }
}
