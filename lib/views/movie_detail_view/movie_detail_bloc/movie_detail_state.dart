part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitialState extends MovieDetailState {}
class MovieDetailLoadingState extends MovieDetailState {
  final bool isLoading;

  MovieDetailLoadingState(this.isLoading);
}
class MovieDetailItemSuccessState extends MovieDetailState {
  final MovieDetailModel items;

  MovieDetailItemSuccessState(this.items);
}
class MovieDetailErrorState extends MovieDetailState {}
