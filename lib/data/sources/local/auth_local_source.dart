import 'dart:convert';

import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/string_utils.dart';
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
        return Success(data: null);
      } else {
        return Failure(error: Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(error: Exception(e.toString()));
    }
  }

  Future<ResponseWrapper> setLoggedInUser(UserModel userModel) async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      bool isSuccessful = await sharedPreferences.setString(
          StringUtils.userSharedPrefsKey, json.encode(userModel));
      if (isSuccessful) {
        return Success(data: null);
      } else {
        return Failure(error: Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(error: Exception(e.toString()));
    }
  }

  Future<ResponseWrapper<UserModel>> getCurrentUser() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      String? jsonUser =
          sharedPreferences.getString(StringUtils.userSharedPrefsKey);
      if (jsonUser != null) {
        UserModel userModel = json.decode(jsonUser);
        return Success(data: userModel);
      } else {
        return Failure(error: Exception("Shared preferences didn't work"));
      }
    } catch (e) {
      return Failure(error: Exception(e.toString()));
    }
  }
}
