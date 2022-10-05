import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/product/models/movie_detail_model/movie_detail_model.dart';
import 'package:vexana/vexana.dart';
abstract class IDetailService {
  final INetworkManager networkManager;

  IDetailService({required this.networkManager});
  final String detailPath = IDetailServicePath.detail.returnValue;
  final String baseUrl = IDetailServicePath.baseUrl.returnValue;
  final String apiKey = ApplicationConstants.instance.apiKey;
  Future<MovieDetailModel?> fetchMoveDetail({required String movieId});
}
enum IDetailServicePath { baseUrl,detail }


extension IWordServicePathExtension on IDetailServicePath {
  String get returnValue {
    switch (this) {
      case IDetailServicePath.detail:
        return "movie/";
      case IDetailServicePath.baseUrl:
        return ApplicationConstants.instance.baseUrl;
      default:
        return "";
    }
  }
}