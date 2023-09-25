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
          //TODO fix this bang operator
          final results = moviesListResponse.results!;
          return Success(
              data: results.map((movie) => movie.getMovieModel).toList());
        }
        return Failure(error: Exception("Movies Result list is null"));
      } else {
        return Failure(
            error: APIException(
                message:
                    response.statusMessage ?? ApiUtils.genericApiErrorMessage,
                statusCode:
                    response.statusCode ?? ApiUtils.standardServerError));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
