import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/constants/project_constant.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_service/detail_service.dart';

void main() {
  late MovieDetailCubit movieDetailCubit;
  setUp(() {
    movieDetailCubit = MovieDetailCubit(
        DetailService(ProjectConstants.instance.networkManager));
  });
  test("movie id is equal to response from service", () async {
    movieDetailCubit.movieId = "432778";
    await movieDetailCubit.fetchMoveDetailItem();
    expect(movieDetailCubit.detailItems.id, 432778);
  });
}
