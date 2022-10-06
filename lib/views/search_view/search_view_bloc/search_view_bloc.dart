import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/views/search_view/search_model/search_movie_model.dart';
import 'package:movie_app/views/search_view/search_service/i_search_service.dart';

part 'search_view_event.dart';
part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  final ISearchService searchService;

  late List<SearchMovieResult> searchResultItems;

  bool isPagingLoading = false;

  SearchViewCubit(this.searchService) : super(SearchViewInitialState());

  late int pageNumber;
  late String query;

  void changeLoading() {
    isPagingLoading = !isPagingLoading;
  }

  void onValueChange(String val) {
    if (val.length > 2) {
      query = val;
      pageNumber = 1;
      fetchSearchItems();
    }
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels >= notification.metrics.maxScrollExtent &&
        !notification.metrics.outOfRange) {
      fetchSearchItemsPaging();
    }
    return true;
  }

  Future<void> fetchSearchItems() async {
    emit(SearchViewLoadingState(true));
    final items =
        await searchService.fetchSearchList(page: pageNumber, query: query);
    if (items == null) {
      emit(SearchViewErrorState());
    } else {
      if (items.results != null) {
        emit(SearchViewSuccessState(items.results!));
      }
    }
    if (items != null) {
      if (items.results != null) {
        searchResultItems = items.results!;
      }
    }
  }

  Future<void> fetchSearchItemsPaging() async {
    changeLoading();
    emit(SearchViewSuccessState(searchResultItems));

    pageNumber += 1;
    if (isPagingLoading) {
      return;
    }
    final items =
        await searchService.fetchSearchList(page: pageNumber, query: query);
    changeLoading();
    if (items != null) {
      if (items.results != null) {
        searchResultItems.addAll(items.results!);
      }
    }
    emit(SearchViewSuccessState(searchResultItems));
  }
}
