import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends RegisterEvent {
  final String name;

  const NameChanged({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'NameChanged { name :$name }';
}

class PhoneChanged extends RegisterEvent {
  final String phone;

  const PhoneChanged({@required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() => 'PhoneChanged { email :$phone }';
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends RegisterEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  const Submitted({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name ,phone ,email, password];

  @override
  String toString() {
    return 'Submitted {name: $name, phone: $phone, email: $email, password: $password }';
  }
}

class RegisterWithDataPressed extends RegisterEvent {
  final String name;
  final String phone;
  final String email;
  final String password;


  const RegisterWithDataPressed({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name, phone, email, password];

  @override
  String toString() {
    return 'RegisterWithDataPressed {name: $name, phone: $phone, email: $email, password: $password }';
  }
}
