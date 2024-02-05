/*MIT License

Copyright (c) 2024 Hung Phan (@hp210693)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/forgot-pass/forgot_pass_event.dart';
import 'package:motel/bloc/forgot-pass/forgot_pass_state.dart';
import 'package:motel/repository/forgot_pass_repo.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  final _forgotPassRepo = ForgotPassRepo();
  ForgotPassBloc() : super(ForgotPassInitialState()) {
    log("ForgotPassBloc constructor");
    on<ForgotPassEvent>(_forgotPass);
  }

  Future<void> _forgotPass(
      ForgotPassEvent event, Emitter<ForgotPassState> emit) async {
    if (event is SentRequestEvent) {
      log("ForgotPassBloc LoginInEvent");
      emit(ForgotPassLoadingState());
      try {
        final respon = await _forgotPassRepo.sentRequest(event.userName);
        log("ForgotPassBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(ForgotPassSuccessState(respon));
      } catch (error) {
        log("ForgotPassBloc call error");
        emit(ForgotPassFailureState(error.toString()));
      }
    }
    if (event is BackToLoginEvent) {
      log("ForgotPassBloc LoginInEvent");
      emit(ForgotPassLoadingState());
    }
  }
}
