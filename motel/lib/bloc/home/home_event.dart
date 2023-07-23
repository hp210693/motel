abstract class HomeEvent {}

class HomeFetchDataEvent extends HomeEvent {
  final String _userName;
  final String _passWord;

  HomeFetchDataEvent(this._userName, this._passWord);

  /// return String user name
  String get userName => _userName;

  /// return String password
  String get passWord => _passWord;
}
