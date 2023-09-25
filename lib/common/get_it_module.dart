import 'package:dio/dio.dart';
import 'package:fluttertmdb/data/repositories/auth/auth_repo_impl.dart';
import 'package:fluttertmdb/data/repositories/movies/movies_repo_impl.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/data/sources/local/movie_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/remote_movies_source.dart';
import 'package:fluttertmdb/data/utils/dio_client.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';
import 'package:fluttertmdb/domain/usecases/movies/add_favourite_movie_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_all_movies_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_favourite_movies_usecase.dart';
import 'package:fluttertmdb/domain/usecases/users/get_current_user_usecase.dart';
import 'package:fluttertmdb/domain/usecases/users/login_user_usecase.dart';
import 'package:fluttertmdb/domain/usecases/users/logout_user_usecase.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.instance;

Future init() async {
  // Dio provided into the ApiClient
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(dio: Dio()));

  //Movies Module
  getItInstance.registerLazySingleton<RemoteMoviesSource>(
      () => RemoteMoviesSource(apiClient: getItInstance()));
  getItInstance
      .registerLazySingleton<LocalMovieSource>(() => LocalMovieSource());
  getItInstance.registerLazySingleton<MoviesRepository>(() => MoviesRepoImpl(
      remoteNewsSource: getItInstance(), localMovieSource: getItInstance()));
  getItInstance.registerLazySingleton<GetAllMoviesUseCase>(
      () => GetAllMoviesUseCase(moviesRepository: getItInstance()));
  getItInstance.registerLazySingleton<AddFavouriteMovieUsecase>(
      () => AddFavouriteMovieUsecase(moviesRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetFavouriteMoviesUseCase>(
      () => GetFavouriteMoviesUseCase(moviesRepository: getItInstance()));

  // Users Module
  getItInstance.registerLazySingleton<AuthLocalSource>(() => AuthLocalSource());
  getItInstance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authLocalSource: getItInstance()));
  getItInstance.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(authRepository: getItInstance()));
  getItInstance.registerLazySingleton<LoginUserUsecase>(
      () => LoginUserUsecase(authRepository: getItInstance()));
  getItInstance.registerLazySingleton<LogoutUserUsecase>(
      () => LogoutUserUsecase(authRepository: getItInstance()));
}
