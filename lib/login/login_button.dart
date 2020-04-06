import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
      child: ButtonTheme(
        minWidth: 350.0,
        height: 45.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: _onPressed,
          child: Text('Login', style: TextStyle(color: Colors.white)),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}


//
