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
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/bloc/nav-router/nav_router_state.dart';

class NavRouterBloc extends Bloc<NavRouterEvent, NavRouterState> {
  NavRouterBloc() : super(NavAppInitState()) {
    log("\n\nLoging -- class $runtimeType -- Contructor ${StackFrame.fromStackTrace(StackTrace.current)[0].isConstructor}\n\n");
    on<NavRouterEvent>(_navEvent);
  }
  Future<void> _navEvent(
      NavRouterEvent event, Emitter<NavRouterState> emit) async {
    switch (event.runtimeType) {
      case NavAppInitEvent:
        log("NavRouterBloc appInit ");
        emit(NavSplashState());
        break;
      case NavLoginEvent:
        log("NavRouterBloc login ");
        emit(NavLoginState());
        break;
      case NavSignUpEvent:
        log("NavRouterBloc signUp ");
        emit(NavSignUpState());
        break;
      case NavForgotPassEvent:
        log("NavRouterBloc forgotPass ");
        emit(NavForgotPassState());
        break;
      case NavBottomBarEvent:
        log("NavRouterBloc bottomBar ");
        emit(NavBottomBarState());
        break;
      case NavHomeEvent:
        log("NavRouterBloc home");
        emit(NavHomeState());
        break;
      case NavDetailEvent:
        if (event is NavDetailEvent) {
          log("NavRouterBloc detail $event");
          emit(NavDetailState(event.room));
        }
        break;
      case NavNothingEvent:
        log("NavRouterBloc nothing");
        emit(NavNothingState());
        break;
      case NavShowRoomEvent:
        log("NavRouterBloc show room detail");
        if (event is NavShowRoomEvent) {
          emit(NavShowRoomState(event.images));
        }

        break;
      default:
        break;
    }
  }
}
