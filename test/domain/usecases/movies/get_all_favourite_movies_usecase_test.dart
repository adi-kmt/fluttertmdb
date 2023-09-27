import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_favourite_movies_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_all_movies_usecase_test.mocks.dart';

@GenerateMocks([MoviesRepository, MovieModel])
void main() {
  late MoviesRepository moviesRepository;
  late GetFavouriteMoviesUseCase getFavouriteMoviesUseCase;
  late MovieModel movieModel;

  setUpAll(() {
    movieModel = MockMovieModel();
    moviesRepository = MockMoviesRepository();
    getFavouriteMoviesUseCase =
        GetFavouriteMoviesUseCase(moviesRepository: moviesRepository);
  });

  test("Check success", () async {
    provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));

    when(moviesRepository.getAllFavouriteMovies())
        .thenAnswer((inv) async => ResponseWrapper.Success([movieModel]));

    expect(await getFavouriteMoviesUseCase.call(), isA<Success>());
  });

  test("Check failure", () async {
    provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));

    when(moviesRepository.getAllFavouriteMovies())
        .thenAnswer((inv) async => ResponseWrapper.Failure(Exception()));

    expect(await getFavouriteMoviesUseCase.call(), isA<Failure>());
  });
}
