import 'package:fluttertmdb/data/models/remote_movie_entity.dart';

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

extension RemoteMovieEntityExtension on RemoteMovieResults {
  MovieModel get getMovieModel => MovieModel(
        releaseDate: this.releaseDate ?? "",
        title: this.title ?? "",
        id: this.id ?? 0,
        overview: this.overview ?? "",
        originalLanguage: this.originalLanguage ?? "",
        voteCount: this.voteCount ?? 0,
        posterPath: this.posterPath ?? "",
        voteAverage: this.voteAverage ?? 0,
      );
}
