import 'package:dio/dio.dart';
import 'package:movie_app/core/utilities/network_query.dart';
import 'package:movie_app/views/search_view/search_model/search_movie_model.dart';
import 'package:movie_app/views/search_view/search_service/i_search_service.dart';

class SearchService extends ISearchService {
  SearchService(Dio manager) : super(networkManager: manager);

  @override
  Future<SearchMovieModel?> fetchSearchList(
      {required String query, int page = 1}) async {
    final response = await networkManager.get(
      searchPath,
      queryParameters: Map.fromEntries(
        [
          NetworkQuery.page.pageQuery(page),
          NetworkQuery.search.searchQuery(query)
        ],
      ),
    );
    print("respınse ${response.data}");
    final resultModel = response.data;
    if (resultModel != null) {
      final dataList = SearchMovieModel.fromJson(resultModel);
      return dataList;
    }
    return null;
  }
}
