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
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/report/report_event.dart';
import 'package:motel/bloc/report/report_state.dart';
import 'package:motel/repository/report_repo.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final _reportRepo = ReportRepo();

  ReportBloc() : super(ReportPageSelectedState(0, false)) {
    log("\n\nLoging -- class $runtimeType -- contructor ${StackFrame.fromStackTrace(StackTrace.current)[0].isConstructor}\n\n");
    on<ReportEvent>(_eventReport);
  }

  Future<void> _eventReport(
      ReportEvent event, Emitter<ReportState> emit) async {
    switch (event.runtimeType) {
      case ReportFetchDataEvent:
        await _fetchReport(event, emit);
        break;
      case ReportPageSelectedEvent:
        await _selectedPage(event, emit);
        break;
      default:
        break;
    }
  }

  Future<void> _fetchReport(event, emit) async {
    log("\n\nLoging -- class $runtimeType -- method ${StackFrame.fromStackTrace(StackTrace.current)[0].method}\n\n");
    try {
      final respon = await _reportRepo.getReportFetchData();
      log("ReportBloc respon data\n = $respon");
      await Future.delayed(const Duration(seconds: 2));
      emit(ReportSuccessedState(respon));
      await Future.delayed(const Duration(seconds: 1));
      emit(ReportInitialState());
    } catch (error) {
      log("\n\nLoging -- class $runtimeType -- method ${StackFrame.fromStackTrace(StackTrace.current)[0].method}\n\n");
      await Future.delayed(const Duration(seconds: 1));
      emit(ReportErrorState(error.toString()));
    }
  }

  Future<void> _selectedPage(event, emit) async {
    log("\n\nLoging -- class $runtimeType -- method ${StackFrame.fromStackTrace(StackTrace.current)[0].method}\n\n");
    emit(ReportLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    switch (event.pageSelected) {
      case 0:
        emit(ReportPageSelectedState(0, true));
        break;
      case 1:
        emit(ReportPageSelectedState(1, true));
        break;
      case 2:
        emit(ReportPageSelectedState(2, true));
        break;
      default:
        emit(ReportPageSelectedState(-100, false));
        break;
    }
  }
}
