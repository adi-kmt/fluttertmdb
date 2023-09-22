import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class GetMovieByIdUsecase {
  final MoviesRepository moviesRepository;

  GetMovieByIdUsecase({required this.moviesRepository});

  Future<ResponseWrapper<MovieModel>> call(int id) async {
    return await moviesRepository.getMovieById(id);
  }
}
