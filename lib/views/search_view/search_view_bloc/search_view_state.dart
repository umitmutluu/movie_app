part of 'search_view_bloc.dart';

@immutable
abstract class SearchViewState {}

class SearchViewInitialState extends SearchViewState {}


class SearchViewLoadingState extends SearchViewState {
  final bool isLoading;

  SearchViewLoadingState(this.isLoading);
}
class SearchViewSuccessState extends SearchViewState {
  final List<SearchMovieResult> items;

  SearchViewSuccessState(this.items);
}
class SearchViewErrorState extends SearchViewState {}
