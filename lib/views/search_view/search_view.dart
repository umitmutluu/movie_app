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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomTextFormField(
            hintText: "Query...",
            controller: searchBarEditingController,
            onChange: context.read<SearchViewCubit>().onValueChange,
          )),
      body: buildBodyText(state, context),
    );
  }

  Widget buildBodyText(SearchViewState state, BuildContext context) {
    if (state is SearchViewInitialState) {
      return state.buildWidget();
    } else if (state is SearchViewLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SearchViewSuccessState) {
      return NotificationListener<ScrollNotification>(
          onNotification: context.read<SearchViewCubit>().onNotification,
          child: state.buildWidget());
    }
    throw WidgetNotFoundException<SearchView, SearchViewState>(state);
  }
}
