import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/welcome/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fastpizzaapp/login/login_screen.dart';

class WelcomeLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
      child: ButtonTheme(
      minWidth: 350.0,
      height: 45.0,
      child: RaisedButton(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }),
        );
      },
      child: Text('Login', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      ),
    ),
    );
    }
  }

