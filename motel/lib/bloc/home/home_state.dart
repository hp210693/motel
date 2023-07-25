abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessedState extends HomeState {
  final Map rooms;
  HomeSuccessedState(this.rooms);

  /// return a message when user login in successed
//  String get message => _message;
}

class HomeErrorState extends HomeState {
  final String _errMessage;
  HomeErrorState(this._errMessage);

  /// return a string when user login in or login out error
  String get errMessage => _errMessage;
}
