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
