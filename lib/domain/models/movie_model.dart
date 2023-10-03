import 'package:fluttertmdb/data/models/local_movie_entity.dart';
import 'package:fluttertmdb/data/models/remote_movie_entity.dart';

class MovieModel {
  final String releaseDate;
  final String title;
  final int id;
  final String overview;
  final String originalLanguage;
  final int voteCount;
  final String posterPath;

  MovieModel(
      {required this.releaseDate,
      required this.title,
      required this.id,
      required this.overview,
      required this.originalLanguage,
      required this.voteCount,
      required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      releaseDate: json[MovieFields.releaseDate],
      title: json[MovieFields.title],
      id: json[MovieFields.id] as int,
      overview: json[MovieFields.overview],
      originalLanguage: json[MovieFields.originalLanguage],
      voteCount: json[MovieFields.voteCount] as int,
      posterPath: json[MovieFields.posterPath]);

  Map<String, dynamic> toJson() => {
        MovieFields.releaseDate: releaseDate,
        MovieFields.title: title,
        MovieFields.id: id,
        MovieFields.overview: overview,
        MovieFields.originalLanguage: originalLanguage,
        MovieFields.voteCount: voteCount,
        MovieFields.posterPath: posterPath
      };
}

extension RemoteMovieEntityExtension on RemoteMovieResults {
  MovieModel get getMovieModel => MovieModel(
      releaseDate: this.releaseDate ?? "",
      title: this.title ?? "",
      id: this.id ?? 0,
      overview: this.overview ?? "",
      originalLanguage: this.originalLanguage ?? "",
      voteCount: this.voteCount ?? 0,
      posterPath: this.posterPath ?? "");
}
