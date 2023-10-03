class ApiUtils {
  ApiUtils._();

  // Base URL
  static const String baseUrl = "https://api.themoviedb.org/";

  // Endpoints
  static const String getMoviesEndpoint = "3/discover/movie";

  //Api key
  static const String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZDNmNzkwMWNhNjA5YjNmYWY5NjZhNzM4Y2VkMjQwNiIsInN1YiI6IjYzYmQwYzA3YTZlMmQyMDA5MjExNTI2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sDP7Rr5I-tUQESuKBFUGgagGwPVQFOpnCnsVkn7tFn0';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const int standardServerError = 500;

  static const String genericApiErrorMessage = "Unexpected API error";
}
