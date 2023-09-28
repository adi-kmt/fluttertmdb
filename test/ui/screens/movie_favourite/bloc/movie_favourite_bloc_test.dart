import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_favourite_movies_usecase.dart';
import 'package:fluttertmdb/ui/screens/movie_favourite/bloc/movie_favourite_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../domain/usecases/movies/add_favourite_movie_usecase.mocks.dart';
import 'movie_favourite_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetFavouriteMoviesUseCase>(
      onMissingStub: OnMissingStub.returnDefault)
])
void main() {
  late final GetFavouriteMoviesUseCase getFavouriteMoviesUseCase;
  late final MovieFavouriteCubit movieFavouriteCubit;
  late final MovieModel movieModel;

  setUpAll(() {
    movieModel = MockMovieModel();
    getFavouriteMoviesUseCase = MockGetFavouriteMoviesUseCase();
    movieFavouriteCubit = MovieFavouriteCubit(
        getFavouriteMoviesUseCase: getFavouriteMoviesUseCase);
  });

  test("Check initial state", () {
    expect(movieFavouriteCubit.state, isA<Initial>());
  });

  blocTest("Check success",
      setUp: () async {
        provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
        when(getFavouriteMoviesUseCase.call()).thenAnswer(
            (invocation) async => ResponseWrapper.Success([movieModel]));
      },
      build: () => movieFavouriteCubit,
      act: (cubit) => cubit.getFavouriteMoviesResponse(),
      expect: () => <Matcher>[isA<Loading>(), isA<Sucess>()]);

  blocTest("Check failure",
      setUp: () async {
        provideDummy(ResponseWrapper<List<MovieModel>>.Success([movieModel]));
        provideDummy(
            ResponseWrapper.Failure(Exception("Something went wrong")));
        when(getFavouriteMoviesUseCase.call()).thenAnswer((invocation) async =>
            ResponseWrapper.Failure(Exception("Something went wrong")));
      },
      build: () => movieFavouriteCubit,
      act: (cubit) => cubit.getFavouriteMoviesResponse(),
      expect: () => <Matcher>[isA<Loading>(), isA<UiFailure>()]);
}
