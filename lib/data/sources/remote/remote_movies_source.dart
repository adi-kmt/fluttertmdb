import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/models/remote_movie_entity.dart';
import 'package:fluttertmdb/data/models/wrappers/api_exception.dart';
import 'package:fluttertmdb/data/utils/api_utils.dart';
import 'package:fluttertmdb/data/utils/dio_client.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';

class RemoteMoviesSource {
  final ApiClient apiClient;

  RemoteMoviesSource({required this.apiClient});

  Future<ResponseWrapper<List<MovieModel>>> getAllmovies() async {
    try {
      final response = await apiClient.get(ApiUtils.getMoviesEndpoint);

      if (response.statusCode == 200) {
        final moviesListResponse = RemoteMovieEntity.fromJson(response.data);
        if (moviesListResponse.results != null) {
          final results = moviesListResponse.results ?? List.empty();
          return Success(results.map((movie) => movie.getMovieModel).toList());
        }
        return Failure(Exception("Movies Result list is null"));
      } else {
        return Failure(APIException(
            message: response.statusMessage ?? ApiUtils.genericApiErrorMessage,
            statusCode: response.statusCode ?? ApiUtils.standardServerError));
      }
    } on Exception catch (e, _) {
      return Failure(e);
    }
  }
}
