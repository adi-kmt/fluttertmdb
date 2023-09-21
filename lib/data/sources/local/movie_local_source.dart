import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/string_utils.dart';
import 'package:fluttertmdb/data/models/local_movie_entity.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalMovieSource {
  Database? _database;

  LocalMovieSource();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(StringUtils.dbName);
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
      return Failure(
          error: Exception("Something went wrong in the local storage"));
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
      return Failure(
          error: Exception("Something went wrong in the local storage"));
    }
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
