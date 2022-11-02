import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_model/movie_detail_model.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_service/i_detail_service.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  IDetailService detailService;

  late String? movieId;

  late MovieDetailModel detailItems;

  MovieDetailCubit(this.detailService, {this.movieId})
      : super(MovieDetailInitialState()) {
    movieId;
    fetchMoveDetailItem();
  }

  Future<void> fetchMoveDetailItem() async {
    emit(MovieDetailLoadingState(true));
    final items =
        await detailService.fetchMoveDetail(movieId: movieId ?? "432778");

    if (items == null) {
      emit(MovieDetailErrorState());
    } else {
      emit(MovieDetailItemSuccessState(items));
    }
    if (items != null) {
      detailItems = items;
    }
  }
}
