import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'move_detail_event.dart';
part 'move_detail_state.dart';

class MoveDetailBloc extends Bloc<MoveDetailEvent, MoveDetailState> {
  MoveDetailBloc() : super(MoveDetailInitial()) {
    on<MoveDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
