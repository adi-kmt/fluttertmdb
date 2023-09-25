import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource authLocalSource;
  AuthRepositoryImpl({required this.authLocalSource});

  @override
  Future<ResponseWrapper> clearLoggedInUser() {
    // TODO: add firebase logout here
    return authLocalSource.clearLoggedInUser();
  }

  @override
  Future<ResponseWrapper<UserModel>> getCurrentUser() {
    return authLocalSource.getCurrentUser();
  }

  @override
  Future<ResponseWrapper> setLoggedInUser(UserModel userModel) {
    // TODO: add firebase login here
    return authLocalSource.setLoggedInUser(userModel);
  }
}
