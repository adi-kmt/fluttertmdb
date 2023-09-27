import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_all_movies_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_all_movies_usecase_test.mocks.dart';

@GenerateMocks([MoviesRepository, MovieModel])
void main() {
  late MoviesRepository moviesRepository;
  late GetAllMoviesUseCase getAllMoviesUseCase;
  late MovieModel movieModel;

  setUpAll(() {
    movieModel = MockMovieModel();
    moviesRepository = MockMoviesRepository();
    getAllMoviesUseCase =
        GetAllMoviesUseCase(moviesRepository: moviesRepository);
  });

  test("Check success", () async {
    provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));

    when(moviesRepository.getAllMovies())
        .thenAnswer((inv) async => ResponseWrapper.Success([movieModel]));

    expect(await getAllMoviesUseCase.call(), isA<Success>());
  });

  test("Check failure", () async {
    provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));

    when(moviesRepository.getAllMovies())
        .thenAnswer((inv) async => ResponseWrapper.Failure(Exception()));

    expect(await getAllMoviesUseCase.call(), isA<Failure>());
  });
}
