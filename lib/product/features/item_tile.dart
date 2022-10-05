import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/core/constants/image_constants.dart';

class ItemTile extends StatelessWidget {
  final String? image;
  final String? movieTitle;
  final String? point;
  final String? id;

  const ItemTile({Key? key, this.image, this.movieTitle, this.point, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 140,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Image.network(
                ApplicationConstants.instance.imageBaseUrl + "$image",
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
          Positioned(
              left: 10,
              bottom: 50,
              child: Container(
                height: 20,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Text(point ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1),
              )),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    movieTitle ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
