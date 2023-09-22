import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/models/wrappers/api_exception.dart';
import 'package:fluttertmdb/data/sources/remote/remote_movies_source.dart';
import 'package:fluttertmdb/data/utils/dio_client.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';

Map<String, dynamic> value = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/55Rb9qt3yzyF4KQpC1c3T3Fbcao.jpg",
      "genre_ids": [27, 53],
      "id": 1008042,
      "original_language": "en",
      "original_title": "Talk to Me",
      "overview":
          "When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.",
      "popularity": 2583.568,
      "poster_path": "/kdPMUMJzyYAc4roD52qavX0nLIC.jpg",
      "release_date": "2023-07-26",
      "title": "Talk to Me",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 656
    }
  ],
  "total_pages": 40133,
  "total_results": 802653
};

class FakeApiClientSuccess implements ApiClient {
  @override
  Dio dio = Dio(); // Doesn't matter, maybe remove

  FakeApiClientSuccess();

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return Response(
        requestOptions: RequestOptions(), data: value, statusCode: 200);
  }
}

class FakeApiClientFailure implements ApiClient {
  @override
  Dio dio = Dio(); // Doesn't matter, maybe remove

  FakeApiClientFailure();

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return Response(
        requestOptions: RequestOptions(),
        data: jsonEncode("Something went wrong"),
        statusCode: 500);
  }
}

class FakeApiClientThrowException implements ApiClient {
  @override
  Dio dio = Dio(); // Doesn't matter, maybe remove

  FakeApiClientThrowException();

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    throw Exception("Something went wrong");
  }
}

void main() {
  late final RemoteMoviesSource remoteMoviesSource;
  late final ApiClient apiClient;

  test("Check Success Fake", () async {
    apiClient = FakeApiClientSuccess();
    remoteMoviesSource = RemoteMoviesSource(apiClient: apiClient);
    final response = await remoteMoviesSource.getAllmovies();
    expect(response, isA<Success>());
    final data = (response as Success).data as List<MovieModel>;
    expect(data.length, 1);
    expect(data.first.id, value["results"][0]["id"]);
    expect(
        data.first.originalLanguage, value["results"][0]["original_language"]);
    expect(data.first.title, value["results"][0]["title"]);
  });

  test("Check failure Fake", () async {
    apiClient = FakeApiClientFailure();
    remoteMoviesSource = RemoteMoviesSource(apiClient: apiClient);
    final response = await remoteMoviesSource.getAllmovies();
    expect(response, isA<Failure>());
    final exception = (response as Failure).error as APIException;
    expect(exception.statusCode, 500);
  });

  test("Check Exception Fake", () async {
    apiClient = FakeApiClientThrowException();
    remoteMoviesSource = RemoteMoviesSource(apiClient: apiClient);
    final response = await remoteMoviesSource.getAllmovies();
    expect(response, isA<Failure>());
  });
}
