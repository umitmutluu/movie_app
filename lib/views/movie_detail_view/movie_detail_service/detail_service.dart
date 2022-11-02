import 'package:dio/dio.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_model/movie_detail_model.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_service/i_detail_service.dart';

class DetailService extends IDetailService {
  DetailService(Dio manager) : super(networkManager: manager);
  @override
  Future<MovieDetailModel?> fetchMoveDetail({required String movieId}) async {
    final response = await networkManager.get(
      detailPath + movieId + apiKey,
    );

    final resultModel = response.data;
    if (resultModel != null) {
      final result = MovieDetailModel.fromJson(resultModel);
      return result;
    } else {
      return null;
    }
  }
}
