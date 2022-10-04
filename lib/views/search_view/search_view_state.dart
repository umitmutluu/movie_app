part of 'search_view_bloc.dart';

abstract class SearchViewState {}

class SearchViewInitial extends SearchViewState {}
class HostLoadingState extends SearchViewState {}

class HostSuccessState extends SearchViewState {
  final SearchMovieModel searchModel;

  HostSuccessState(this.searchModel);
}

class HostFailureState extends SearchViewState {
  final String error;

  HostFailureState(this.error);
}