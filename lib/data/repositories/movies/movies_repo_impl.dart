import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/remote/remote_movies_source.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class MoviesRepoImpl implements MoviesRepository {
  final RemoteMoviesSource remoteNewsSource;

  MoviesRepoImpl({required this.remoteNewsSource});

  @override
  Future<ResponseWrapper<List<MovieModel>>> getAllMovies() {
    return remoteNewsSource.getAllmovies();
  }

  @override
  Future<ResponseWrapper<MovieModel>> getMovieById(int id) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }
}
