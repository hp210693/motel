import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/login/login_event.dart';
import 'package:motel/bloc/login/login_state.dart';
import 'package:motel/data/login/login.dart';
import 'package:motel/repository/login/login_repo_imp.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _loginRepo = LoginRepoImp();
  LoginBloc() : super(LoginInitialState()) {
    log("LoginBloc constructor");
    on<LoginInEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginInEvent) {
      log("LoginBloc LoginInEvent");
      emit(LoginLoadingState());
      await _loginRepo
          .getLoginInData(event.userName, event.passWord)
          .then((value) {
        Login respon = value as Login; //Login.fromJson(value);
        log("Then LoginBloc respon = $respon");
        /* if (respon.status == "ok") {
          emit(LoginSuccessedState(respon.message));
        } else {
          emit(LoginErrorState(respon.message));
        } */
      }).onError((error, stackTrace) {
        log("LoginBloc call error");
        emit(LoginErrorState(error.toString()));
      });
    }
  }
}
