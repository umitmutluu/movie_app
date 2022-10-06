import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/views/search_view/search_model/search_movie_model.dart';

abstract class ISearchService {
  final Dio networkManager;

  ISearchService({required this.networkManager});

  final String searchPath = ISearchServicePath.search.returnValue;
  final String baseUrl = ISearchServicePath.baseUrl.returnValue;

  Future<SearchMovieModel?> fetchSearchList(
      {required String query, int page = 0});
}

enum ISearchServicePath { baseUrl, search }

extension IWordServicePathExtension on ISearchServicePath {
  String get returnValue {
    switch (this) {
      case ISearchServicePath.search:
        return "search/movie${ApplicationConstants.instance.apiKey}";
      case ISearchServicePath.baseUrl:
        return ApplicationConstants.instance.baseUrl;
      default:
        return "";
    }
  }
}
