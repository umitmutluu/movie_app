import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/models/search_model/search_movie_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISearchService {
  final INetworkManager networkManager;

  ISearchService({required this.networkManager});
  final String searchPath = ISearchServicePath.SEARCH.returnValue;
  final String baseUrl = ISearchServicePath.BASEURL.returnValue;

  Future<List<SearchMovieResult>?> fetchSearchList({required String query,int page = 0});
}
enum ISearchServicePath { BASEURL,SEARCH }


extension IWordServicePathExtension on ISearchServicePath {
  String get returnValue {
    switch (this) {
      case ISearchServicePath.SEARCH:
        return "search/movie${ApplicationConstants.instance.apiKey}";
        case ISearchServicePath.BASEURL:
        return ApplicationConstants.instance.BASE_URL;
      default:
        return "";
    }
  }
}