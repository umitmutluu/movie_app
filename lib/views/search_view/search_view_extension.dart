import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/image_constants.dart';
import 'package:movie_app/product/features/item_tile.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_view.dart';
import 'package:movie_app/views/search_view/search_view_bloc/search_view_bloc.dart';

extension SearchInialWidget on SearchViewInitialState {
  void navigate() {}

  Widget buildWidget() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            ImageConstants.instance!.backGround,
            fit: BoxFit.fill,
          ),
        ),
        const Center(
          child: SizedBox(
              width: 250,
              child: Text(
                "Enter the name of the movie you want to find in the search box above.",
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }
}

extension SearchListItemWidget on SearchViewSuccessState {
  void navigate() {}

  Widget buildWidget() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            ImageConstants.instance!.backGround,
            fit: BoxFit.fill,
          ),
        ),
        GridView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetailView(
                    movieID: items[index].id.toString(),
                  ),
                ),
              );
            },
            child: ItemTile(
                id: items[index].id.toString(),
                image: items[index].posterPath,
                movieTitle: items[index].title,
                point: items[index].voteAverage.toString()),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7,
          ),
          padding: const EdgeInsets.all(5),
        ),
      ],
    );
  }
}
