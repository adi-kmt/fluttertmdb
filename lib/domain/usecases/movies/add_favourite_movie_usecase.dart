import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

import '../../models/movie_model.dart';

class AddFavouriteMovieUsecase {
  final MoviesRepository moviesRepository;

  AddFavouriteMovieUsecase({required this.moviesRepository});

  Future<ResponseWrapper> call(MovieModel movie) async {
    return await moviesRepository.addFavouriteMovie(movie);
  }
}
