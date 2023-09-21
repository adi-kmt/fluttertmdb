import 'package:dio/dio.dart';
import 'package:fluttertmdb/data/repositories/movies/movies_repo_impl.dart';
import 'package:fluttertmdb/data/sources/remote/remote_movies_source.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_all_movies_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_movie_by_id_usecase.dart';
import 'package:get_it/get_it.dart';

import '../data/utils/dio_client.dart';

final getItInstance = GetIt.instance;

Future init() async {
  // Dio provided into the ApiClient
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(dio: Dio()));

  //Movies Module
  getItInstance.registerLazySingleton<RemoteMoviesSource>(
      () => RemoteMoviesSource(apiClient: getItInstance()));
  getItInstance.registerLazySingleton<MoviesRepository>(
      () => MoviesRepoImpl(remoteNewsSource: getItInstance()));
  getItInstance.registerLazySingleton<GetAllMoviesUseCase>(
      () => GetAllMoviesUseCase(moviesRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetMovieByIdUsecase>(
      () => GetMovieByIdUsecase(moviesRepository: getItInstance()));
}
