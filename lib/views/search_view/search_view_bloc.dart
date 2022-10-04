import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/search_model/search_movie_model.dart';

part 'search_view_event.dart';
part 'search_view_state.dart';

class SearchViewBloc extends Bloc<SearchViewEvent, SearchViewState> {
  SearchViewBloc() : super(SearchViewInitial()) {
    on<SearchViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
