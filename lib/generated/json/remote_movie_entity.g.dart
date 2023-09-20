import 'package:fluttertmdb/generated/json/base/json_convert_content.dart';
import 'package:fluttertmdb/data/models/remote_movie_entity.dart';

RemoteMovieEntity $RemoteMovieEntityFromJson(Map<String, dynamic> json) {
  final RemoteMovieEntity remoteMovieEntity = RemoteMovieEntity();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    remoteMovieEntity.page = page;
  }
  final List<RemoteMovieResults>? results = (json['results'] as List<dynamic>?)
      ?.map((e) =>
          jsonConvert.convert<RemoteMovieResults>(e) as RemoteMovieResults)
      .toList();
  if (results != null) {
    remoteMovieEntity.results = results;
  }
  final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
  if (totalPages != null) {
    remoteMovieEntity.totalPages = totalPages;
  }
  final int? totalResults = jsonConvert.convert<int>(json['total_results']);
  if (totalResults != null) {
    remoteMovieEntity.totalResults = totalResults;
  }
  return remoteMovieEntity;
}

Map<String, dynamic> $RemoteMovieEntityToJson(RemoteMovieEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['results'] = entity.results?.map((v) => v.toJson()).toList();
  data['total_pages'] = entity.totalPages;
  data['total_results'] = entity.totalResults;
  return data;
}

extension RemoteMovieEntityExtension on RemoteMovieEntity {
  RemoteMovieEntity copyWith({
    int? page,
    List<RemoteMovieResults>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return RemoteMovieEntity()
      ..page = page ?? this.page
      ..results = results ?? this.results
      ..totalPages = totalPages ?? this.totalPages
      ..totalResults = totalResults ?? this.totalResults;
  }
}

RemoteMovieResults $RemoteMovieResultsFromJson(Map<String, dynamic> json) {
  final RemoteMovieResults remoteMovieResults = RemoteMovieResults();
  final bool? adult = jsonConvert.convert<bool>(json['adult']);
  if (adult != null) {
    remoteMovieResults.adult = adult;
  }
  final String? backdropPath =
      jsonConvert.convert<String>(json['backdrop_path']);
  if (backdropPath != null) {
    remoteMovieResults.backdropPath = backdropPath;
  }
  final List<int>? genreIds = (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (genreIds != null) {
    remoteMovieResults.genreIds = genreIds;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    remoteMovieResults.id = id;
  }
  final String? originalLanguage =
      jsonConvert.convert<String>(json['original_language']);
  if (originalLanguage != null) {
    remoteMovieResults.originalLanguage = originalLanguage;
  }
  final String? originalTitle =
      jsonConvert.convert<String>(json['original_title']);
  if (originalTitle != null) {
    remoteMovieResults.originalTitle = originalTitle;
  }
  final String? overview = jsonConvert.convert<String>(json['overview']);
  if (overview != null) {
    remoteMovieResults.overview = overview;
  }
  final double? popularity = jsonConvert.convert<double>(json['popularity']);
  if (popularity != null) {
    remoteMovieResults.popularity = popularity;
  }
  final String? posterPath = jsonConvert.convert<String>(json['poster_path']);
  if (posterPath != null) {
    remoteMovieResults.posterPath = posterPath;
  }
  final String? releaseDate = jsonConvert.convert<String>(json['release_date']);
  if (releaseDate != null) {
    remoteMovieResults.releaseDate = releaseDate;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    remoteMovieResults.title = title;
  }
  final bool? video = jsonConvert.convert<bool>(json['video']);
  if (video != null) {
    remoteMovieResults.video = video;
  }
  final double? voteAverage = jsonConvert.convert<double>(json['vote_average']);
  if (voteAverage != null) {
    remoteMovieResults.voteAverage = voteAverage;
  }
  final int? voteCount = jsonConvert.convert<int>(json['vote_count']);
  if (voteCount != null) {
    remoteMovieResults.voteCount = voteCount;
  }
  return remoteMovieResults;
}

Map<String, dynamic> $RemoteMovieResultsToJson(RemoteMovieResults entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adult'] = entity.adult;
  data['backdrop_path'] = entity.backdropPath;
  data['genre_ids'] = entity.genreIds;
  data['id'] = entity.id;
  data['original_language'] = entity.originalLanguage;
  data['original_title'] = entity.originalTitle;
  data['overview'] = entity.overview;
  data['popularity'] = entity.popularity;
  data['poster_path'] = entity.posterPath;
  data['release_date'] = entity.releaseDate;
  data['title'] = entity.title;
  data['video'] = entity.video;
  data['vote_average'] = entity.voteAverage;
  data['vote_count'] = entity.voteCount;
  return data;
}

extension RemoteMovieResultsExtension on RemoteMovieResults {
  RemoteMovieResults copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return RemoteMovieResults()
      ..adult = adult ?? this.adult
      ..backdropPath = backdropPath ?? this.backdropPath
      ..genreIds = genreIds ?? this.genreIds
      ..id = id ?? this.id
      ..originalLanguage = originalLanguage ?? this.originalLanguage
      ..originalTitle = originalTitle ?? this.originalTitle
      ..overview = overview ?? this.overview
      ..popularity = popularity ?? this.popularity
      ..posterPath = posterPath ?? this.posterPath
      ..releaseDate = releaseDate ?? this.releaseDate
      ..title = title ?? this.title
      ..video = video ?? this.video
      ..voteAverage = voteAverage ?? this.voteAverage
      ..voteCount = voteCount ?? this.voteCount;
  }
}
