abstract class LoginEvent {}

class LoginInEvent extends LoginEvent {
  final String _userName;
  final String _passWord;

  LoginInEvent(this._userName, this._passWord);

  /// return String user name
  String get userName => _userName;

  /// return String password
  String get passWord => _passWord;
}

class LoginOutEvent extends LoginEvent {
  final String _userName;
  final String _passWord;
  LoginOutEvent(this._userName, this._passWord);
}

class LoginForwardEvent extends LoginEvent {
  final String _message;
  LoginForwardEvent(this._message);
}
