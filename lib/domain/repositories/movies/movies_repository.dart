import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';

abstract class MoviesRepository {
  Future<ResponseWrapper<List<MovieModel>>> getAllMovies();

  Future<ResponseWrapper> addFavouriteMovie(MovieModel movie);

  Future<ResponseWrapper<List<MovieModel>>> getAllFavouriteMovies();

  Future<ResponseWrapper> deleteFavouriteMovie(int id);

  Future<ResponseWrapper> checkIfMovieIsFavourite(int id);
}
