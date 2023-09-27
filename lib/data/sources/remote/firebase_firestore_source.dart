import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/utils/local_source_utils.dart';

class FirebaseFirestoreSource {
  Future<ResponseWrapper<String>> addLikedMovieItem(int id) async {
    final collection = FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName);
    final docId = collection.doc().id;
    await collection.add({"id": id});
    return Success(docId);
  }

  Future<ResponseWrapper<List<int>>> getAllLikedMovies() async {
    final moviesList = await FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .get()
        .then((value) => value.docs.map((e) => e.data()["id"] as int).toList(),
            onError: (e) => Failure(e));
    return Success(moviesList);
  }

  Future<ResponseWrapper> deleteFavouriteMovie(String docId) async {
    return await FirebaseFirestore.instance
        .collection(LocalSourceUtils.firebaseCollectionsName)
        .doc(docId)
        .delete()
        .then((value) => Success(null), onError: (e) => Failure(Exception(e)));
  }
}
