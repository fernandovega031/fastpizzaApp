import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends ForgotPasswordEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}


class Submitted extends ForgotPasswordEvent {
  final String email;


  const Submitted({
    @required this.email,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'Submitted { email: $email}';
  }
}

class SendEmailPressed extends ForgotPasswordEvent {
  final String email;

  const SendEmailPressed({
    @required this.email,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'SendEmailPressed { email: $email}';
  }
}
