import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/user_repository.dart';
import 'package:fastpizzaapp/register/register.dart';

class RegisterScreen extends StatelessWidget {
  /** final UserRepository _userRepository;

      LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child: RegisterForm(),
      ),
    );
  }
}
