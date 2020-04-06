import 'package:flutter/material.dart';
import 'package:fastpizzaapp/user_repository.dart';
import 'package:fastpizzaapp/forgot_password/forgot_password_screen.dart';

class ForgotPasswordButton extends StatelessWidget {
  /*final UserRepository _userRepository;

  ForgotPasswordButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Forgot your password?',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return ForgotPasswordScreen();
          }),
        );
      },
    );
  }
}
