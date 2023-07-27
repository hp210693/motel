import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/bottom/bottom_event.dart';
import 'package:motel/bloc/bottom/bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {
  BottomBloc() : super(BottomInitState());
}
