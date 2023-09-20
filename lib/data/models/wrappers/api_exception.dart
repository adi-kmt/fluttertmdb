// For common exceptions to be passed on
class APIException implements Exception {
  final String message;
  final int statusCode;

  APIException({required this.message, required this.statusCode});
}
