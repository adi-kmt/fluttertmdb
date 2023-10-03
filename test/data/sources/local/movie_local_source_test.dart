import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/local/movie_local_source.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late LocalMovieSource moviesLocalSource;

  setUpAll(() async {
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux) {
      // Initialize FFI
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
    WidgetsFlutterBinding.ensureInitialized();
    unawaited(get_it.init());
    moviesLocalSource = get_it.getItInstance();
  });

  test("Check init", () async {
    final movie = MovieModel(
        releaseDate: "releaseDate",
        title: "title",
        id: 0,
        overview: "overview",
        originalLanguage: "originalLanguage",
        voteCount: 2,
        posterPath: "posterPath");

    await moviesLocalSource.insertMovie(movie);
    final movieRecieved = await moviesLocalSource.getAllMovies();

    final movieFirst =
        ((movieRecieved as Success).data as List<MovieModel>).first;

    expect(isA<MovieModel>, isA<MovieModel>);
  });
}
