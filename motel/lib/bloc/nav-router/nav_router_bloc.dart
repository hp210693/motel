/*MIT License

Copyright (c) 2020 Hung Phan (@hp210693)

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
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/bloc/nav-router/nav_router_state.dart';

class NavRouterBloc extends Bloc<NavRouterEvent, NavRouterState> {
  NavRouterBloc() : super(NavRouterInitState()) {
    on<NavRouterEvent>(_login);
  }
  Future<void> _login(
      NavRouterEvent event, Emitter<NavRouterState> emit) async {
    switch (event.runtimeType) {
      case NavRouterInitEvent:
        log("NavRouterBloc NavRouterInitEvent ");

        emit(NavRouterSplashState());
        break;
      case MoveToLoginEvent:
        log("NavRouterBloc MoveToLoginEvent ");
        await Future.delayed(const Duration(seconds: 2));
        emit(NavRouterLoginState());
        break;
      case MoveToHomeEvent:
        log("NavRouterBloc MoveToHomeEvent");
        emit(NavRouterHomeState());
        break;
      default:
        break;
    }
  }
}
