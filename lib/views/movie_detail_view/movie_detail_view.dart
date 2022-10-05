import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/project_constant.dart';
import 'package:movie_app/core/exception/widget_not_found_exception.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_view_extension.dart';
import 'movie_detail_service/detail_service.dart';

class MovieDetailView extends StatelessWidget {
  final String? movieID;

  const MovieDetailView({Key? key,  this.movieID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieCubit = MovieDetailCubit(
        DetailService(ProjectConstants.instance.networkManager), movieID!);
    return BlocProvider(
      lazy: true,
      create: (context) => movieCubit,
      child: BlocConsumer<MovieDetailCubit, MovieDetailState>(
        listener: (context, state) {
          if (state is MovieDetailErrorState) {}
          if (state is MovieDetailInitialState) {
            // state.navigate();
          }
        },
        builder: (context, state) {
          return buildScaffold(state, context);
        },
      ),
    );
  }

  Widget buildScaffold(MovieDetailState state, BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title:
              const Text("Movie Title", style: TextStyle(color: Colors.black)),
        ),
        body: buildBodyText(state, context),
      ),
    );
  }

  Widget buildBodyText(MovieDetailState state, context) {
    if (state is MovieDetailInitialState) {
      return state.buildWidget();
    } else if (state is MovieDetailLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MovieDetailItemSuccessState) {
      return state.buildWidget();
    }
    throw WidgetNotFoundException<MovieDetailView, MovieDetailState>(state);
  }
}
