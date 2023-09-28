import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_all_movies_usecase.dart';
import 'package:fluttertmdb/ui/screens/movie_list/bloc/movie_list_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_list_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetAllMoviesUseCase>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MovieModel>(onMissingStub: OnMissingStub.returnDefault)
])
void main() {
  late final GetAllMoviesUseCase getAllMoviesUseCase;
  late final MovieListCubit movieListCubit;
  late final MovieModel movieModel;

  setUpAll(() {
    movieModel = MockMovieModel();
    getAllMoviesUseCase = MockGetAllMoviesUseCase();
    movieListCubit = MovieListCubit(getAllMoviesUseCase: getAllMoviesUseCase);
  });

  test("Check initial state", () {
    expect(movieListCubit.state, isA<Initial>());
  });

  blocTest("Check success",
      setUp: () async {
        provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
        when(getAllMoviesUseCase.call()).thenAnswer(
            (invocation) async => ResponseWrapper.Success([movieModel]));
      },
      build: () => movieListCubit,
      act: (cubit) => cubit.getAllMovies(),
      expect: () => <Matcher>[isA<Loading>(), isA<Sucess>()]);

  blocTest("Check failure",
      setUp: () async {
        provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
        provideDummy(
            ResponseWrapper.Failure(Exception("Something went wrong")));
        when(getAllMoviesUseCase.call()).thenAnswer((invocation) async =>
            ResponseWrapper.Failure(Exception("Something went wrong")));
      },
      build: () => movieListCubit,
      act: (cubit) => cubit.getAllMovies(),
      expect: () => <Matcher>[isA<Loading>(), isA<UiFailure>()]);
}
