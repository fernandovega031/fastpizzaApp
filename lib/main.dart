import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/user_repository.dart';
import 'package:fastpizzaapp/simple_bloc_delegate.dart';
import 'package:fastpizzaapp/welcome/welcome_screen.dart';
import 'package:fastpizzaapp/splash_screen.dart';
import 'package:fastpizzaapp/authentication_bloc/authentication_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return WelcomeScreen();
          }
         /* if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }*/
        },
      ),
    );
  }
}
