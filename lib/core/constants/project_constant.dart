import 'package:movie_app/core/utilities/network_route.dart';
import 'package:vexana/vexana.dart';

class ProjectConstants {
  static ProjectConstants? _instance;
  static ProjectConstants get instance {
    _instance ??= ProjectConstants._init();
    return _instance!;
  }

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: NetworkRoute.baseUrl.rawValue),
  );

  ProjectConstants._init();
}
