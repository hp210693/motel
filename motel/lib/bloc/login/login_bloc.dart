import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/login/login_event.dart';
import 'package:motel/bloc/login/login_state.dart';
import 'package:motel/repository/login/login_repo_imp.dart';

import '../../error_base/error_base.dart';

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
      try {
        final respon =
            await _loginRepo.getLoginInData(event.userName, event.passWord);
        log("LoginBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccessedState(respon.message));
        await Future.delayed(const Duration(seconds: 1));
        emit(LoginInitialState());
      } catch (error) {
        var error = ErrorBase();
        /*  if (e.osError?.errorCode == 101) {
          error.statusCode = 101;
          error.message = e.osError!.message;
          throw Exception(error);
        }
        error.statusCode = e.osError!.errorCode;
        error.message = e.osError!.message;
        if (e.osError?.errorCode == 101) {
          //  error.statusCode = 101;
          //error.message = e.osError!.message;
          error.convertedData = false;
          throw Exception(error);
        }
        error.statusCode = e.osError!.errorCode;
        error.message = e.osError!.message; */
        log("LoginBloc call error");
        //  await Future.delayed(const Duration(seconds: 1));
        emit(LoginErrorState(error.toString()));
      }
    }
  }
}
