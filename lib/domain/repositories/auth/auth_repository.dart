import 'package:fluttertmdb/common/response_wrapper.dart';

import '../../models/user_model_entity.dart';

abstract class AuthRepository {
  Future<ResponseWrapper<UserModel>> getCurrentUser();

  Future<ResponseWrapper> setLoggedInUser(UserModel user);

  Future<ResponseWrapper> clearLoggedInUser();
}
