import 'package:movie_app/core/constants/application_constant.dart';
import 'package:movie_app/models/movie_detail_model/movie_detail_model.dart';
import 'package:vexana/vexana.dart';

abstract class IDetailService {
  final INetworkManager networkManager;

  IDetailService({required this.networkManager});
  final String detailPath = IDetailServicePath.DETAIL.returnValue;
  final String baseUrl = IDetailServicePath.BASEURL.returnValue;
  final String apiKey = ApplicationConstants.instance.apiKey;
  Future<MovieDetailModel?> fetchMoveDetail({required String movieId});
}
enum IDetailServicePath { BASEURL,DETAIL }


extension IWordServicePathExtension on IDetailServicePath {
  String get returnValue {
    switch (this) {
      case IDetailServicePath.DETAIL:
        return "movie/";
      case IDetailServicePath.BASEURL:
        return ApplicationConstants.instance.BASE_URL;
      default:
        return "";
    }
  }
}