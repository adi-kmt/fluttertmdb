import 'package:dio/dio.dart';

import 'api_utils.dart';

class ApiClient {
  late final Dio dio;

  ApiClient({required this.dio}) {
    dio
      ..options.baseUrl = ApiUtils.baseUrl
      ..options.headers = <String, dynamic>{
        "Authorization": "Bearer ${ApiUtils.bearerToken}",
        "accept": "application/json"
      }
      ..options.connectTimeout =
          const Duration(seconds: ApiUtils.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(seconds: ApiUtils.receiveTimeout)
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
