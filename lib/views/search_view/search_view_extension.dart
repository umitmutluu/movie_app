import 'package:flutter/material.dart';
import 'package:movie_app/product/features/item_tile.dart';
import 'package:movie_app/views/search_view/search_view_bloc/search_view_bloc.dart';

extension SearchInialWidget on SearchViewInitialState {
  void navigate() {}
  Widget buildWidget() {
    return Container(color: Colors.cyan,);
  }
}

extension UsersListItemWidget on SearchViewSuccessState {
  void navigate() {}
  Widget buildWidget() {
    return GridView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ItemTile(image: items[index].posterPath,movieTitle: items[index].title,point: items[index].voteCount.toString()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5,childAspectRatio: 1,
      ),padding: const EdgeInsets.all(5),
    );
  }
}
