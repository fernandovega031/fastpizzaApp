import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback _onPressed;

  SendButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container
      (
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: ButtonTheme(
        minWidth: 350.0,
        height: 45.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: _onPressed,
          child: Text('Send', style: TextStyle(color: Colors.white)),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}


//
