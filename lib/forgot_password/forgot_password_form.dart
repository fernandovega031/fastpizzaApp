import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastpizzaapp/user_repository.dart';
import 'package:fastpizzaapp/authentication_bloc/authentication_bloc.dart';
import 'package:fastpizzaapp/forgot_password/forgot_password.dart';

class ForgotPasswordForm extends StatefulWidget {
  //final UserRepository _userRepository;

  /*LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);*/

  State<ForgotPasswordForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordBloc _forgotPasswordBloc;

  // UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty;

  bool isSendButtonEnabled(ForgotPasswordState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }



  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
    _emailController.addListener(_onEmailChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Send link Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Send a email...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 140.0, 20.0),
                    child:  Text(
                      'Forgot your password',
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: TextStyle(
                          color: Color.fromRGBO(232, 79, 84, 1.0),
                          fontWeight: FontWeight.w700,
                          fontSize: 30
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 40.0),
                    child:  Text(
                      'Please enter your email to receive a link to create your new password',
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 17
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                        hintText: '   Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SendButton(
                          onPressed: isSendButtonEnabled(state)
                              ? _onFormSubmitted
                              : _onFormSubmitted,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _forgotPasswordBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onFormSubmitted() {
    _forgotPasswordBloc.add(
      SendEmailPressed(
        email: _emailController.text
      ),
    );
  }
}