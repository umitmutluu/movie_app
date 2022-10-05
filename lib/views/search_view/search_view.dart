import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/project_constant.dart';
import 'package:movie_app/core/exception/widget_not_found_exception.dart';
import 'package:movie_app/product/features/custom_text_form_field.dart';
import 'package:movie_app/views/search_view/search_service/search_service.dart';
import 'package:movie_app/views/search_view/search_view_bloc/search_view_bloc.dart';
import 'package:movie_app/views/search_view/search_view_extension.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final searchCubit =
      SearchViewCubit(SearchService(ProjectConstants.instance.networkManager));
  final TextEditingController searchBarEditingController =
      TextEditingController();

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
            flexibleSpace: CustomTextFormField(
              hintText: "Query...",
              controller: searchBarEditingController,
              onChange: (val) {
                if (val.length > 2) {
                  context.read<SearchViewCubit>().query = val;
                  context.read<SearchViewCubit>().pageNumber = 1;
                  context.read<SearchViewCubit>().fetchSearchItems();
                }
              },
            )),
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
            if (notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent &&
                !notification.metrics.outOfRange) {
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
