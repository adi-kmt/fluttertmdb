import 'package:fluttertmdb/common/platform_utils.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/local/movie_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/remote_movies_source.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class MoviesRepoImpl implements MoviesRepository {
  final RemoteMoviesSource remoteNewsSource;
  final LocalMovieSource localMovieSource;

  MoviesRepoImpl(
      {required this.remoteNewsSource, required this.localMovieSource});

  @override
  Future<ResponseWrapper<List<MovieModel>>> getAllMovies() async {
    if (isMobile()) {
      try {
        final networkResponse = await remoteNewsSource.getAllmovies();
        if (networkResponse is Success) {
          final movies = (networkResponse as Success).data as List<MovieModel>;
          movies.map((movie) => localMovieSource.insertMovie(movie));
        }
        // Since movies are being saved in the local storage as is and
        // it is the single source of truth, even when network fails, we send data
        // present in the local storage.
        return localMovieSource.getAllMovies();
      } catch (e) {
        return Failure(error: Exception(e));
      }
    } else {
      return remoteNewsSource.getAllmovies();
    }
  }
}
