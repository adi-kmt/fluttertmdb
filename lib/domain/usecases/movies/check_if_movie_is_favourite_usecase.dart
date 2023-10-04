import '../../../common/response_wrapper.dart';
import '../../repositories/movies/movies_repository.dart';

class CheckIfMovieIsFavouriteUsecase {
  final MoviesRepository moviesRepository;

  CheckIfMovieIsFavouriteUsecase({required this.moviesRepository});

  Future<ResponseWrapper> call(int id) async {
    return await moviesRepository.checkIfMovieIsFavourite(id);
  }
}
