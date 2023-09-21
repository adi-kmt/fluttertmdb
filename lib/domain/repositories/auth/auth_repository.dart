import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<ResponseWrapper<UserModel>> getCurrentUser();

  Future<ResponseWrapper> setLoggedInUser(UserModel userModel);

  Future<ResponseWrapper> clearLoggedInUser();
}
