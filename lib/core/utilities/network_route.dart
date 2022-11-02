import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/core/exception/network_route_exception.dart';

enum NetworkRoute { baseUrl }

extension NetworkRouteExtension on NetworkRoute {
  String get rawValue {
    switch (this) {
      case NetworkRoute.baseUrl:
        return ApplicationConstants.instance.baseUrl;
      default:
        throw NetworkRouteException();
    }
  }
}
