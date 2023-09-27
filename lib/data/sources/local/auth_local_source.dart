import 'dart:convert';

import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/utils/local_source_utils.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalSource {
  late final SharedPreferences sharedPreferences;

  AuthLocalSource();

  Future<ResponseWrapper> clearLoggedInUser() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      bool isSuccessful = await sharedPreferences.clear();
      if (isSuccessful) {
        return Success(null);
      } else {
        return Failure(Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ResponseWrapper> setLoggedInUser(UserModel userModel) async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      bool isSuccessful = await sharedPreferences.setString(
          LocalSourceUtils.userSharedPrefsKey, json.encode(userModel));
      if (isSuccessful) {
        return Success(null);
      } else {
        return Failure(Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ResponseWrapper<UserModel>> getCurrentUser() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      String? jsonUser =
          sharedPreferences.getString(LocalSourceUtils.userSharedPrefsKey);
      if (jsonUser != null) {
        UserModel userModel = json.decode(jsonUser);
        return Success(userModel);
      } else {
        return Failure(Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
