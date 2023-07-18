import 'package:flutter/widgets.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessedState extends LoginState {
  final String _message;
  LoginSuccessedState(this._message);

  /// return a message when user login in successed
  String get message => _message;
}

class LoginErrorState extends LoginState {
  final String _errMessage;
  LoginErrorState(this._errMessage);

  /// return a string when user login in or login out error
  String get errMessage => _errMessage;
}
