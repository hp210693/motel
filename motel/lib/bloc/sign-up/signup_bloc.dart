/*MIT License

Copyright (c) 2023 Hung Phan (@hp210693)

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
import 'package:motel/bloc/sign-up/signup_event.dart';
import 'package:motel/bloc/sign-up/signup_state.dart';
import 'package:motel/repository/signup_repo.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _repo = SignUpRepo();
  SignUpBloc() : super(SignUpInitialState()) {
    log("SignUpBloc constructor");
    on<SignUpEvent>(_navEvent);
  }

  Future<void> _navEvent(SignUpEvent event, Emitter<SignUpState> emit) async {
    if (event is SignUpNewEvent) {
      log("SignUpBloc LoginInEvent");
      emit(SignUpLoadingState());
      try {
        final respon = await _repo.postSignUpNewAccountData(
            event.userName, event.phone, event.cid, event.passWord);

        log("SignUpBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(SignUpSuccessedState(respon));
        await Future.delayed(const Duration(seconds: 1));
        emit(SignUpInitialState());
      } catch (error) {
        log("SignUpBloc call error");
        emit(SignUpErrorState(error.toString()));
      }
    }
  }
}
