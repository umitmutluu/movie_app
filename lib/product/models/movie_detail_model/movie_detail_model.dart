import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel extends INetworkModel<MovieDetailModel> {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailModel(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

  @override
  MovieDetailModel fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

@JsonSerializable()
class BelongsToCollection extends INetworkModel<BelongsToCollection> {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);

  @override
  BelongsToCollection fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@JsonSerializable()
class Genres extends INetworkModel<Genres> {
  final int? id;
  final String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GenresToJson(this);

  @override
  Genres fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}

@JsonSerializable()
class ProductionCompanies extends INetworkModel<ProductionCompanies> {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);

  @override
  ProductionCompanies fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);
}

@JsonSerializable()
class ProductionCountries extends INetworkModel<ProductionCountries> {
  final String? iso31661;
  final String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);

  @override
  ProductionCountries fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);
}

@JsonSerializable()
class SpokenLanguages extends INetworkModel<SpokenLanguages> {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);

  @override
  SpokenLanguages fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);
}
