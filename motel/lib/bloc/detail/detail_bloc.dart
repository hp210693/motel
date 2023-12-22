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
import 'package:motel/bloc/detail/detail_event.dart';
import 'package:motel/bloc/detail/detail_state.dart';
import 'package:motel/data/room.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  // final _loginRepo = LoginRepo();

  DetailBloc() : super(DetailInitialState()) {
    log("DetailBloc constructor");
    on<DetailInitialEvent>(_detail);
  }

  Future<void> _detail(DetailEvent event, Emitter<DetailState> emit) async {
    if (event is DetailInitialEvent) {
      log("DetailBloc DetailInitialEvent");
      emit(DetailLoadingState());
      try {
        /* final respon =
            await _loginRepo.getLoginInData(event.userName, event.passWord);
        log("DetailBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccessedState(respon));
        await Future.delayed(const Duration(seconds: 1));
        emit(LoginInitialState()); */
        emit(DetailSuccessedState(event.room));
      } catch (error) {
        log("DetailBloc call error");
        emit(DetailErrorState(error.toString()));
      }
    }
  }
}
