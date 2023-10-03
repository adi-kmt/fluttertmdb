import 'dart:convert';

import 'package:fluttertmdb/generated/json/base/json_field.dart';
import 'package:fluttertmdb/generated/json/user_model_entity.g.dart';

export 'package:fluttertmdb/generated/json/user_model_entity.g.dart';

@JsonSerializable()
class UserModel {
  String? email;
  String? password;

  UserModel();

  UserModel.fromUser(String anotherEmail, String anotherPassword)
      : email = anotherEmail,
        password = anotherPassword;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      $UserModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
