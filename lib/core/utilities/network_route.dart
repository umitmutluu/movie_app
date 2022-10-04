import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/core/exception/network_route_exception.dart';


enum NetworkRoute { BASE_URL, SEARCH,DETAIL }

extension NetworkRouteExtension on NetworkRoute {
  String get rawValue {
    switch (this) {
      case NetworkRoute.BASE_URL:
        return ApplicationConstants.instance.BASE_URL;
      case NetworkRoute.SEARCH:
        return ApplicationConstants.instance.BASE_URL + "search/movie" + ApplicationConstants.instance.apiKey;
      default:
        throw NetworkRotueException();
    }
  }
}
