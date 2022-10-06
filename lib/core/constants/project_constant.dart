import 'package:dio/dio.dart';
import 'package:movie_app/core/utilities/network_route.dart';

class ProjectConstants {
  static ProjectConstants? _instance;
  static ProjectConstants get instance {
    _instance ??= ProjectConstants._init();
    return _instance!;
  }

  Dio networkManager = Dio(
    BaseOptions(baseUrl: NetworkRoute.baseUrl.rawValue),
  );

  ProjectConstants._init();
}
