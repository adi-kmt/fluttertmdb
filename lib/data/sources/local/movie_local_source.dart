import 'dart:collection';

import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/models/local_movie_entity.dart';
import 'package:fluttertmdb/data/models/local_movie_favourite_entity.dart';
import 'package:fluttertmdb/data/utils/local_source_utils.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalMovieSource {
  Database? _database;

  LocalMovieSource();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(LocalSourceUtils.dbName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const keyType = "INTEGER PRIMARY KEY";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";

    await db.execute("""
      CREATE TABLE $moviesTable (
      ${MovieFields.id} $keyType,
      ${MovieFields.title} $textType,
      ${MovieFields.releaseDate} $textType,
      ${MovieFields.overview} $textType,
      ${MovieFields.originalLanguage} $textType,
      ${MovieFields.voteCount} $intType,
      ${MovieFields.posterPath} $textType
      )
      """);
    await db.execute("""
    CREATE TABLE $movieFavouritesTable (
    ${MovieFavouritesFields.id} $keyType,
    ${MovieFavouritesFields.docId} $textType
    )
    """);
  }

  Future<bool> insertMovie(MovieModel movieModel) async {
    try {
      final db = await database;
      return await db.insert(moviesTable, movieModel.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace) >
          0;
    } catch (e) {
      return false;
    }
  }

  Future<ResponseWrapper<MovieModel>> getMovieById(int id) async {
    try {
      final db = await database;
      final movieMap = await db
          .query(moviesTable, where: '${MovieFields.id} = ?', whereArgs: [id]);
      if (movieMap.isNotEmpty && movieMap.firstOrNull != null) {
        return Success(data: MovieModel.fromJson(movieMap.first));
      } else {
        return Failure(error: Exception("Movie not found in the db"));
      }
    } catch (e) {
      return Failure(error: Exception(e));
    }
  }

  Future<ResponseWrapper<List<MovieModel>>> getAllMovies() async {
    try {
      final db = await database;
      final movieMapList = await db.query(moviesTable);
      if (movieMapList.isNotEmpty) {
        final movieList = movieMapList
            .map((movieMap) => MovieModel.fromJson(movieMap))
            .toList();
        return Success(data: movieList);
      } else {
        return Failure(error: Exception("No movies found in the db"));
      }
    } catch (e) {
      return Failure(error: Exception(e));
    }
  }

  Future<ResponseWrapper> addFavouriteMovie(Map<String, int> map) async {
    try {
      final db = await database;
      final result = await db.insert(
              movieFavouritesTable,
              {
                MovieFavouritesFields.id: map["id"],
                MovieFavouritesFields.docId: map["docId"]
              },
              conflictAlgorithm: ConflictAlgorithm.replace) >
          0;
      if (result) {
        return Success(data: true);
      } else {
        return Failure(error: Exception("Insert DB doesn't work"));
      }
    } catch (e) {
      return Failure(error: Exception(e));
    }
  }

  Future<ResponseWrapper<List<MovieModel>>> getFavouriteMovies() async {
    try {
      final db = await database;
      final idMapList = await db.query(movieFavouritesTable);
      if (idMapList.isNotEmpty) {
        final idList = idMapList
            .map((idMap) => idMap[MovieFavouritesFields.id] as int)
            .toList();
        final movieMapList = await db.query(moviesTable,
            where: '${MovieFields.id} = ?', whereArgs: idList);
        if (movieMapList.isNotEmpty) {
          final movieList = movieMapList
              .map((movieMap) => MovieModel.fromJson(movieMap))
              .toList();
          return Success(data: movieList);
        } else {
          return Failure(error: Exception("Movie not found in the db"));
        }
      } else {
        return Failure(error: Exception("No favourite movies found in the db"));
      }
    } catch (e) {
      return Failure(error: Exception(e));
    }
  }

  Future<ResponseWrapper> deleteFavouriteMovie(int id) async {
    try {
      final db = await database;
      final dbResult = db.delete(movieFavouritesTable,
          where: '$MovieFields.id = ?', whereArgs: [id]);
      //TODO check conditions
      return Success(data: null);
    } catch (e) {
      return Failure(error: Exception(e));
    }
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
