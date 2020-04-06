import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fastpizzaapp/forgot_password/forgot_password.dart';
import 'package:fastpizzaapp/user_repository.dart';
import 'package:fastpizzaapp/validators.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  UserRepository _userRepository;

  /*LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;*/

  @override
  ForgotPasswordState get initialState => ForgotPasswordState.empty();

  @override
  Stream<ForgotPasswordState> transformEvents(
      Stream<ForgotPasswordEvent> events,
      Stream<ForgotPasswordState> Function(ForgotPasswordEvent event) next,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged );
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is SendEmailPressed) {
      yield* _mapSendEmailPressedToState(
        email: event.email,
      );
    }
  }

  Stream<ForgotPasswordState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }


  Stream<ForgotPasswordState> _mapSendEmailPressedToState({
    String email,
  }) async* {
    yield ForgotPasswordState.loading();
    try {
      await _userRepository.sendEmailCredentials(email);
      yield ForgotPasswordState.success();
    } catch (_) {
      yield ForgotPasswordState.failure();
    }
  }
}