import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/welcome/welcome_carousel.dart';
import 'package:fastpizzaapp/welcome/welcome_login_button.dart';
import 'package:fastpizzaapp/welcome/welcome_register_button.dart';

class WelcomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        body: ListView(

          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Column(children: [
                  CarouselWithIndicator(),
                  WelcomeLoginButton(),
                  WelcomeRegisterButton()
                ])),
          ],
        ),

    );
  }
}
