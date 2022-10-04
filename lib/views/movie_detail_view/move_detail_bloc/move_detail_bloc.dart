import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/product/models/movie_detail_model/movie_detail_model.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_service/I_detail_service.dart';

part 'move_detail_event.dart';

part 'move_detail_state.dart';

class MoveDetailCubit extends Cubit<MoveDetailState> {
  IDetailService detailService;

  final String _movieId;

  late MovieDetailModel detailItems;

  MoveDetailCubit(this.detailService, this._movieId)
      : super(MoveDetailInitialState()) {
    _movieId;
  }

  Future<void> fetchMoveDetailItem() async {
    emit(MoveDetailLoadingState(true));
    final items = await detailService.fetchMoveDetail(movieId: _movieId);

    if (items == null) {
      emit(MoveDetailErrorState());
    } else {
      emit(MoveDetailItemSuccessState(items));
    }
    if (items != null) {
      detailItems = items;
    }
  }
}
