import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart';

class GetAllMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetAllMoviesUseCase({required this.moviesRepository});

  Future<ResponseWrapper<List<MovieModel>>> call() async {
    return await moviesRepository.getAllMovies();
  }
}
