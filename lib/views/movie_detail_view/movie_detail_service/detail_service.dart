import 'package:movie_app/product/models/movie_detail_model/movie_detail_model.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_service/I_detail_service.dart';
import 'package:vexana/vexana.dart';

class DetailService extends IDetailService {

  DetailService(INetworkManager manager) : super(networkManager: manager);

  @override
  Future<MovieDetailModel?> fetchMoveDetail({required String movieId})async {
    final response = await networkManager
        .send<MovieDetailModel, MovieDetailModel>( detailPath +movieId +apiKey,
        parseModel: MovieDetailModel(),
        method: RequestType.GET);
final result = response.data;
if(result!=null){
  return result;
}else{
  return null;
}

  }
}