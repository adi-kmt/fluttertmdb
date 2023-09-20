import 'package:fluttertmdb/generated/json/base/json_field.dart';
import 'package:fluttertmdb/generated/json/remote_movie_entity.g.dart';
import 'dart:convert';
export 'package:fluttertmdb/generated/json/remote_movie_entity.g.dart';

@JsonSerializable()
class RemoteMovieEntity {
  int? page;
  List<RemoteMovieResults>? results;
  @JSONField(name: "total_pages")
  int? totalPages;
  @JSONField(name: "total_results")
  int? totalResults;

  RemoteMovieEntity();

  factory RemoteMovieEntity.fromJson(Map<String, dynamic> json) =>
      $RemoteMovieEntityFromJson(json);

  Map<String, dynamic> toJson() => $RemoteMovieEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RemoteMovieResults {
  bool? adult;
  @JSONField(name: "backdrop_path")
  String? backdropPath;
  @JSONField(name: "genre_ids")
  List<int>? genreIds;
  int? id;
  @JSONField(name: "original_language")
  String? originalLanguage;
  @JSONField(name: "original_title")
  String? originalTitle;
  String? overview;
  double? popularity;
  @JSONField(name: "poster_path")
  String? posterPath;
  @JSONField(name: "release_date")
  String? releaseDate;
  String? title;
  bool? video;
  @JSONField(name: "vote_average")
  double? voteAverage;
  @JSONField(name: "vote_count")
  int? voteCount;

  RemoteMovieResults();

  factory RemoteMovieResults.fromJson(Map<String, dynamic> json) =>
      $RemoteMovieResultsFromJson(json);

  Map<String, dynamic> toJson() => $RemoteMovieResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
