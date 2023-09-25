import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class AddFavouriteMovieUsecase {
  final MoviesRepository moviesRepository;

  AddFavouriteMovieUsecase({required this.moviesRepository});

  Future<ResponseWrapper> call(int id) async {
    return await moviesRepository.addFavouriteMovie(id);
  }
}
