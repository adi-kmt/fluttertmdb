class MovieModel {
  final String releaseDate;
  final String title;
  final int id;
  final String overview;
  final String originalLanguage;
  final int voteCount;
  final String posterPath;
  final double voteAverage;

  MovieModel({
    required this.releaseDate,
    required this.title,
    required this.id,
    required this.overview,
    required this.originalLanguage,
    required this.voteCount,
    required this.posterPath,
    required this.voteAverage,
  });
}
