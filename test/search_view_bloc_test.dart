import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/constants/project_constant.dart';
import 'package:movie_app/views/search_view/search_service/search_service.dart';
import 'package:movie_app/views/search_view/search_view_bloc/search_view_bloc.dart';

void main() {
  late SearchService searchService;
  late SearchViewCubit searchViewCubit;
  setUp(() {
    searchViewCubit = SearchViewCubit(
        SearchService(ProjectConstants.instance.networkManager));
    searchService = SearchService(ProjectConstants.instance.networkManager);
  });

  test("page number is start with 1", () async {
    final model = await searchService.fetchSearchList(page: 1, query: "abd");
    expect(model?.page, 1);
  });

  test("search query is match with keyword", () async {
    final model = await searchService.fetchSearchList(page: 1, query: "abd");
    expect(model?.results!.first.title?.contains("a"), true);
    expect(model?.results!.first.title?.contains("b"), true);
    expect(model?.results!.first.title?.contains("d"), true);
  });
  test("value change triggered at query 2 characters", () async {
    searchViewCubit.query = "";
    searchViewCubit.onValueChange("ab");
    expect(searchViewCubit.query == "ab", false);
  });
  test("value change triggered at query 3 characters", () async {
    searchViewCubit.query = "";
    searchViewCubit.onValueChange("abc");
    expect(searchViewCubit.query == "abc", true);
  });
  test("pagination is working true", () async {
    searchViewCubit.pageNumber = 2;
    searchViewCubit.searchResultItems = [];
    await searchViewCubit.fetchSearchItemsPaging();
    expect(searchViewCubit.pageNumber, 3);
  });
  test("change loading working true", () async {
    searchViewCubit.isPagingLoading = true;
    searchViewCubit.changeLoading();
    expect(searchViewCubit.isPagingLoading, false);
  });
}
