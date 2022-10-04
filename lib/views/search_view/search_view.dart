import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/project_constant.dart';
import 'package:movie_app/core/exception/widget_not_found_exception.dart';
import 'package:movie_app/views/search_view/search_service/search_service.dart';
import 'package:movie_app/views/search_view/search_view_bloc/search_view_bloc.dart';
import 'package:movie_app/views/search_view/search_view_extension.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final searchCubit = SearchViewCubit(SearchService(ProjectConstants.instance.networkManager));
final TextEditingController searchBarEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => searchCubit,
      child: BlocConsumer<SearchViewCubit, SearchViewState>(
        listener: (context, state) {
          if (state is SearchViewErrorState) {}
          if (state is SearchViewInitialState) {
          state.navigate();
          }
        },
        builder: (context, state) {
          return buildScaffold(state, context);
        },
      ),
    );
  }

  Widget buildScaffold(SearchViewState state, BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          flexibleSpace: TextFormField(
            controller: searchBarEditingController,
            maxLength: 100,textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            cursorWidth: 1,
            onChanged: (val){
              if(val.length>2){
                context.read<SearchViewCubit>().query=val;
                context.read<SearchViewCubit>().pageNumber=1;
                context.read<SearchViewCubit>().fetchSearchItems();

              }
            },
            cursorColor: const Color(0xFF888888),
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'Query...',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              disabledBorder:  OutlineInputBorder(
                  borderSide:  BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              errorBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Color(0xFF595594)),
                  gapPadding: 8),
              hintStyle: TextStyle(
                  color: Color(0xFF888888), fontSize: 12),
              labelStyle:  TextStyle(
                  color: Color(0xFF888888), fontSize: 12),
              counterText: '',
            ),
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
        ),
        body: buildBodyText(state),
      ),
    );
  }



  Widget buildBodyText(SearchViewState state) {
    if (state is SearchViewInitialState) {
      return state.buildWidget();
    } else if (state is SearchViewLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SearchViewSuccessState) {
      return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels >= notification.metrics.maxScrollExtent ) {
              final _context = notification.context;
              if (_context != null) {
                _context.read<SearchViewCubit>().fetchSearchItemsPaging();
              }
            }
            return true;
          },
          child: state.buildWidget());
    }
    throw WidgetNotFoundException<SearchView, SearchViewState>(state);
  }
}
