import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class DeleteFavouriteMovieUsecase {
  final MoviesRepository moviesRepository;

  DeleteFavouriteMovieUsecase({required this.moviesRepository});

  Future<ResponseWrapper> call(int id) async {
    return await moviesRepository.deleteFavouriteMovie(id);
  }
}
