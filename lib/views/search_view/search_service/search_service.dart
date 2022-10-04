import 'package:movie_app/core/utilities/network_query.dart';
import 'package:movie_app/models/search_model/search_movie_model.dart';
import 'package:movie_app/views/search_view/search_service/I_search_service.dart';
import 'package:vexana/vexana.dart';

class SearchService extends ISearchService {
  SearchService(INetworkManager manager) : super(networkManager: manager);

  @override
  Future<List<SearchMovieResult>?> fetchSearchList(
      {required String query, int page = 0}) async {
    final response = await networkManager
        .send<SearchMovieModel, SearchMovieModel>(baseUrl + searchPath,
            parseModel: SearchMovieModel(),
            method: RequestType.GET,
            queryParameters: Map.fromEntries([
              NetworkQuery.PAGE.pageQuery(page),
              NetworkQuery.SEARCH.searchQuery(query)
            ]));
    final resultModel = response.data;
    if (resultModel != null) {
      final dataList = resultModel.results;
      if (dataList != null) {
        return dataList;
      }
    }
    return [];
  }
}
