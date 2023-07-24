import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/home/home_event.dart';
import 'package:motel/bloc/home/home_state.dart';
import 'package:motel/repository/home/home_repo_imp.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _homeRepo = HomeRepoImp();
  HomeBloc() : super(HomeInitialState()) {
    log("HomeBloc constructor");
    on<HomeEvent>(_fetchRooms);
  }

  FutureOr<void> _fetchRooms(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeFetchDataEvent) {
      log("HomeBloc HomeEvent");
      emit(HomeLoadingState());
      try {
        final respon = await _homeRepo.getHomeFetchData(event.userName);
        log("HomeBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(HomeSuccessedState(respon));
        await Future.delayed(const Duration(seconds: 1));
        emit(HomeInitialState());
      } catch (error) {
        log("HomeBloc call error");
        //  await Future.delayed(const Duration(seconds: 1));
        emit(HomeErrorState(error.toString()));
      }
    }
  }
}
