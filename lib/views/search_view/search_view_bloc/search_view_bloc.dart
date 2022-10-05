import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/product/models/search_movie_model/search_movie_model.dart';
import 'package:movie_app/views/search_view/search_service/i_search_service.dart';

part 'search_view_event.dart';

part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  final ISearchService searchService;

  late List<SearchMovieResult> searchResultItems;

  bool isPagingLoading = false;

  SearchViewCubit(this.searchService) : super(SearchViewInitialState()) {
    // _pageNumber = 1;
    // query = "a";
    // fetchSearchItems();
  }

  late int pageNumber;
  late String query;

  void _changeLoading() {
    isPagingLoading = !isPagingLoading;
  }

  Future<void> fetchSearchItems() async {
    emit(SearchViewLoadingState(true));
    final items =
    await searchService.fetchSearchList(page: pageNumber, query: query);
    if (items == null) {
      emit(SearchViewErrorState());
    } else {
      emit(SearchViewSuccessState(items));
    }
    if (items != null) {
      searchResultItems = items;
    }
  }
    Future<void> fetchSearchItemsPaging() async {
          if (searchResultItems.length<pageNumber*100) {
            _changeLoading();
            emit(SearchViewSuccessState(searchResultItems));

            pageNumber += 1;
            if (isPagingLoading) {
              return;
            }
            final items =
                await searchService.fetchSearchList(page: pageNumber, query: query);
            _changeLoading();
            if (items != null) {
              searchResultItems.addAll(items);
            }


            emit(SearchViewSuccessState(searchResultItems));
          }
        }



}
