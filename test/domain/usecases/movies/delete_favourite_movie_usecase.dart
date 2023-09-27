import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';
import 'package:fluttertmdb/domain/usecases/movies/delete_favourite_movie_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_all_movies_usecase_test.mocks.dart';

@GenerateMocks([MoviesRepository, MovieModel])
void main() {
  late MoviesRepository moviesRepository;
  late DeleteFavouriteMovieUsecase deleteFavouriteMovieUsecase;
  late MovieModel movieModel;

  setUpAll(() {
    movieModel = MockMovieModel();
    moviesRepository = MockMoviesRepository();
    deleteFavouriteMovieUsecase =
        DeleteFavouriteMovieUsecase(moviesRepository: moviesRepository);
  });

  test("Check success", () async {
    provideDummy(ResponseWrapper<dynamic>.Success([movieModel]));

    when(moviesRepository.deleteFavouriteMovie("0"))
        .thenAnswer((inv) async => ResponseWrapper.Success(true));

    expect(await deleteFavouriteMovieUsecase.call("0"), isA<Success>());
  });

  test("Check failure", () async {
    provideDummy(ResponseWrapper<dynamic>.Success([movieModel]));
    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));

    when(moviesRepository.deleteFavouriteMovie("0"))
        .thenAnswer((inv) async => ResponseWrapper.Failure(Exception()));

    expect(await deleteFavouriteMovieUsecase.call("0"), isA<Failure>());
  });
}
