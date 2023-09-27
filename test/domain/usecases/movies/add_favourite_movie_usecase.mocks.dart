// Mocks generated by Mockito 5.4.2 from annotations
// in fluttertmdb/test/domain/usecases/movies/add_favourite_movie_usecase.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fluttertmdb/common/response_wrapper.dart' as _i4;
import 'package:fluttertmdb/domain/models/movie_model.dart' as _i5;
import 'package:fluttertmdb/domain/repositories/movies/movies_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MoviesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesRepository extends _i1.Mock implements _i2.MoviesRepository {
  MockMoviesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>> getAllMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllMovies,
          [],
        ),
        returnValue:
            _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>>.value(
                _i6.dummyValue<_i4.ResponseWrapper<List<_i5.MovieModel>>>(
          this,
          Invocation.method(
            #getAllMovies,
            [],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>>);

  @override
  _i3.Future<_i4.ResponseWrapper<dynamic>> addFavouriteMovie(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #addFavouriteMovie,
          [id],
        ),
        returnValue: _i3.Future<_i4.ResponseWrapper<dynamic>>.value(
            _i6.dummyValue<_i4.ResponseWrapper<dynamic>>(
          this,
          Invocation.method(
            #addFavouriteMovie,
            [id],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<dynamic>>);

  @override
  _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>>
      getAllFavouriteMovies() => (super.noSuchMethod(
            Invocation.method(
              #getAllFavouriteMovies,
              [],
            ),
            returnValue:
                _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>>.value(
                    _i6.dummyValue<_i4.ResponseWrapper<List<_i5.MovieModel>>>(
              this,
              Invocation.method(
                #getAllFavouriteMovies,
                [],
              ),
            )),
          ) as _i3.Future<_i4.ResponseWrapper<List<_i5.MovieModel>>>);

  @override
  _i3.Future<_i4.ResponseWrapper<dynamic>> deleteFavouriteMovie(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavouriteMovie,
          [id],
        ),
        returnValue: _i3.Future<_i4.ResponseWrapper<dynamic>>.value(
            _i6.dummyValue<_i4.ResponseWrapper<dynamic>>(
          this,
          Invocation.method(
            #deleteFavouriteMovie,
            [id],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<dynamic>>);
}

/// A class which mocks [MovieModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieModel extends _i1.Mock implements _i5.MovieModel {
  MockMovieModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get releaseDate => (super.noSuchMethod(
        Invocation.getter(#releaseDate),
        returnValue: '',
      ) as String);

  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: '',
      ) as String);

  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
      ) as int);

  @override
  String get overview => (super.noSuchMethod(
        Invocation.getter(#overview),
        returnValue: '',
      ) as String);

  @override
  String get originalLanguage => (super.noSuchMethod(
        Invocation.getter(#originalLanguage),
        returnValue: '',
      ) as String);

  @override
  int get voteCount => (super.noSuchMethod(
        Invocation.getter(#voteCount),
        returnValue: 0,
      ) as int);

  @override
  String get posterPath => (super.noSuchMethod(
        Invocation.getter(#posterPath),
        returnValue: '',
      ) as String);

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
