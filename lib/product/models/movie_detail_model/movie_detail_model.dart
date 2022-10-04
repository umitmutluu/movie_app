
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_detail_model.g.dart';
@JsonSerializable()
class MovieDetailModel extends INetworkModel<MovieDetailModel> {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

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

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$MovieDetailModelToJson(this);

  @override
  MovieDetailModel fromJson(Map<String, dynamic> json) =>_$MovieDetailModelFromJson(json);

}
@JsonSerializable()
class BelongsToCollection extends INetworkModel<BelongsToCollection>{
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>_$BelongsToCollectionFromJson(json);
@override
  Map<String, dynamic> toJson()=> _$BelongsToCollectionToJson(this);

  @override
  BelongsToCollection fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
}
@JsonSerializable()
class Genres extends INetworkModel<Genres> {
  int? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$GenresToJson(this);

  @override
  Genres fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}
@JsonSerializable()
class ProductionCompanies extends INetworkModel<ProductionCompanies>{
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>_$ProductionCompaniesFromJson(json);

  @override
  Map<String, dynamic> toJson()=>_$ProductionCompaniesToJson(this);

  @override
  ProductionCompanies fromJson(Map<String, dynamic> json) =>_$ProductionCompaniesFromJson(json);
}
@JsonSerializable()
class ProductionCountries extends INetworkModel<ProductionCountries>{
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) => _$ProductionCountriesFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$ProductionCountriesToJson(this);

  @override
  ProductionCountries fromJson(Map<String, dynamic> json) =>_$ProductionCountriesFromJson(json);

}

@JsonSerializable()
class SpokenLanguages extends INetworkModel<SpokenLanguages>{
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);

  @override
  SpokenLanguages fromJson(Map<String, dynamic> json) =>_$SpokenLanguagesFromJson(json);
}
