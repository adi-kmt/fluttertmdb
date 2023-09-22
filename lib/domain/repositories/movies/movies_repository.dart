import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';

abstract class MoviesRepository {
  Future<ResponseWrapper<List<MovieModel>>> getAllMovies();

  Future<ResponseWrapper> addFavouriteMovie(int id);

  Future<ResponseWrapper<List<MovieModel>>> getAllFavouriteMovies();
}
