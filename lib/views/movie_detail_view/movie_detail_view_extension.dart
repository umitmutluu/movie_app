import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/core/constants/image_constants.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_bloc/movie_detail_bloc.dart';

extension MovieDetailInialWidget on MovieDetailInitialState {
  Widget buildWidget() {
    return Center(
      child: Container(
        color: Colors.cyan,
        child: const Text("Someting get  Wrong!"),
      ),
    );
  }
}

extension UsersListItemWidget on MovieDetailItemSuccessState {
  Widget buildWidget() => Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey),
          SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 400,
                  width: 200,
                  child: Image.network(
                      ApplicationConstants.instance.imageBaseUrl +
                          "${items.posterPath}",
                      // ??"https://picsum.photos/200",
                      fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                          Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                          color: Colors.white,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null),
                    );
                  }, errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return Image.asset(
                      ImageConstants.instance!.emptyImage,
                      fit: BoxFit.fill,
                    );
                  }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 140,
                        child: Text(items.overview!,
                            maxLines: 100, style: const TextStyle(fontSize: 13)),
                      ),
                    ),
                    SizedBox(
                        width: 100,
                        height: 50,
                        child: ListView.builder(
                            itemCount: items.genres?.length,
                            itemBuilder: (context, index) =>
                                items.genres!.isNotEmpty
                                    ? Card(
                                        child: Text(items.genres![index].name!),
                                      )
                                    : const SizedBox())),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
