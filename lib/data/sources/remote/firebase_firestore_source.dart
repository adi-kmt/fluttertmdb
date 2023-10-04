import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/utils/local_source_utils.dart';

import '../../../domain/models/movie_model.dart';

class FirebaseFirestoreSource {
  Future<ResponseWrapper<String>> addLikedMovieItem(MovieModel movie) async {
    return FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .doc(movie.id.toString())
        .set(movie.toJson())
        .then((value) => Success(movie.id.toString()),
            onError: (e) => Failure(e));
  }

  Future<ResponseWrapper<List<MovieModel>>> getAllLikedMovies() async {
    return FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .get()
        .then(
            (value) => Success(value.docs
                .map((map) => MovieModel.fromJson(map.data()))
                .toList()),
            onError: (e) => Failure(e));
  }

  Future<ResponseWrapper> deleteFavouriteMovie(int docId) async {
    return FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .doc(docId.toString())
        .delete()
        .then((value) => Success(null), onError: (e) => Failure(Exception(e)));
  }

  Future<ResponseWrapper> checkIfMovieIsFavourite(int id) async {
    return FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .doc(id.toString())
        .get()
        .then((docRef) {
      if (docRef.exists) {
        return Success(null);
      } else {
        return Failure(Exception("Not Favourite Movie"));
      }
    });
  }
}
