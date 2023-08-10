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
import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/report/report_event.dart';
import 'package:motel/bloc/report/report_state.dart';
import 'package:motel/repository/report/report_repo_imp.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final _reportRepo = ReportRepoImp();
  ReportBloc() : super(ReportInitialState()) {
    log("HomeBloc constructor");
    on<ReportEvent>(_fetchReports);
  }

  Future<void> _fetchReports(
      ReportEvent event, Emitter<ReportState> emit) async {
    if (event is ReportFetchDataEvent) {
      log("ReportBloc HomeEvent");
      emit(ReportLoadingState());
      try {
        final respon = await _reportRepo.getReportFetchData();
        log("ReportBloc respon data\n = $respon");
        await Future.delayed(const Duration(seconds: 2));
        emit(ReportSuccessedState(respon));
        await Future.delayed(const Duration(seconds: 1));
        emit(ReportInitialState());
      } catch (error) {
        log("ReportBloc call error");
        await Future.delayed(const Duration(seconds: 1));
        emit(ReportErrorState(error.toString()));
      }
    }
  }
}