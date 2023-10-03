import 'package:fluttertmdb/domain/models/user_model_entity.dart';
import 'package:fluttertmdb/generated/json/base/json_convert_content.dart';

UserModel $UserModelEntityFromJson(Map<String, dynamic> json) {
  final UserModel userModelEntity = UserModel();
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userModelEntity.email = email;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userModelEntity.password = password;
  }
  return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  data['password'] = entity.password;
  return data;
}

extension UserModelEntityExtension on UserModel {
  UserModel copyWith({
    String? email,
    String? password,
  }) {
    return UserModel()
      ..email = email ?? this.email
      ..password = password ?? this.password;
  }
}
