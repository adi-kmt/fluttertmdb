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
      final response = await apiClient.get(
        ApiUtils.movies,
      );

      if (response.statusCode == 200) {
        final newsListResponse = RemoteMovieEntity.fromJson(response.data);
        return Success(
            data: newsListResponse.results
                ?.map((movie) => movie.getMovieModel)
                .toList());
      } else {
        return Failure(
            error: APIException(
                response.statusMessage ?? ApiUtils.genericApiErrorMessage,
                response.statusCode ?? ApiUtils.standardServerError));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
