import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'search_movie_model.g.dart';

@JsonSerializable()
class SearchMovieModel extends INetworkModel<SearchMovieModel> {
  SearchMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  int? page;
  List<SearchMovieResult>? results;
  int? totalPages;
  int? totalResults;

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchMovieModelToJson(this);

  @override
  SearchMovieModel fromJson(Map<String, dynamic>? json) =>_$SearchMovieModelFromJson(json ??{});
}

@JsonSerializable()
class SearchMovieResult extends INetworkModel<SearchMovieResult> {
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

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
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

  factory SearchMovieResult.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchMovieResultToJson(this);

  @override
  SearchMovieResult fromJson(Map<String, dynamic> json)=>_$SearchMovieResultFromJson(json);
}
