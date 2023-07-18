import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/login/login_event.dart';
import 'package:motel/bloc/login/login_state.dart';
import 'package:motel/data/login/login.dart';
import 'package:motel/repository/login/login_repo_imp.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _loginRepo = LoginRepoImp();
  LoginBloc() : super(LoginInitialState()) {
    print("LoginBloc constructor");
    on<LoginInEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginInEvent) {
      print("LoginBloc LoginInEvent");
      emit(LoginLoadingState());
      await _loginRepo
          .getLoginInData(event.userName, event.passWord)
          .onError(
              (error, stackTrace) => emit(LoginErrorState(error.toString())))
          .then((value) {
        Login respon = Login.fromJson(value);
        print("Then LoginBloc respon = $respon");
        if (respon.status == "ok") {
          emit(LoginSuccessedState(respon.message));
        } else {
          emit(LoginErrorState(respon.message));
        }
      });
    }
  }
}
