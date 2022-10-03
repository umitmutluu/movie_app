import 'package:json_annotation/json_annotation.dart';

part 'search_movie_model.g.dart';
@JsonSerializable()
class SearchMovieModel {
  SearchMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) => _$SearchMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieModelToJson(this);
}
@JsonSerializable()
class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>?genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) =>_$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}


