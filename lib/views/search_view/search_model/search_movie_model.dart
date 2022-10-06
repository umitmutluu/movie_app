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
  final int? page;
  final List<SearchMovieResult>? results;
  final int? totalPages;
  final int? totalResults;

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieModelToJson(this);
}

@JsonSerializable()
class SearchMovieResult {
  SearchMovieResult({
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

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory SearchMovieResult.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieResultToJson(this);
}
