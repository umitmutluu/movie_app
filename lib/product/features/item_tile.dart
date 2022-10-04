import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/core/constants/image_constants.dart';
import 'package:movie_app/product/models/search_movie_model/search_movie_model.dart';



class ItemTile extends StatelessWidget {
  final String? image;
  final String? movieTitle;
  final String? point;

  const ItemTile({Key? key, this.image, this.movieTitle, this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter,
      children: [
        Container(width: 140,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Image.network(
              ApplicationConstants.instance.imageBaseUrl+"$image",
              // ??"https://picsum.photos/200",
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(color: Colors.white,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!:null
                  ),
                );
              }, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(ImageConstants.instance!.emptyImage,fit: BoxFit.fill,);}
          ),
        ),

        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieTitle??'',textAlign: TextAlign.left,maxLines: 3,overflow: TextOverflow.visible,style: TextStyle(color: Colors.white,fontSize: 12,),),
          ),
        )
      ],
    );
  }
}
