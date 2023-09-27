import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/firebase_auth_source.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource authLocalSource;
  final FirebaseAuthSource firebaseAuthSource;

  AuthRepositoryImpl(
      {required this.authLocalSource, required this.firebaseAuthSource});

  @override
  Future<ResponseWrapper> clearLoggedInUser() async {
    final result = await firebaseAuthSource.logout();
    if (result is Success) {
      final isSuccess = authLocalSource.clearLoggedInUser();
      if (isSuccess is Success) {
        return Success(true);
      } else {
        return Failure(Exception("Logout failed"));
      }
    } else {
      return Failure(Exception("Logout failed"));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>> getCurrentUser() {
    return authLocalSource.getCurrentUser();
  }

  @override
  Future<ResponseWrapper> setLoggedInUser(UserModel user) async {
    final result = await firebaseAuthSource.login(user);
    if (result is Success) {
      final isSuccess = authLocalSource.setLoggedInUser(user);
      if (isSuccess is Success) {
        return Success(null);
      } else {
        return Failure(Exception("Login failed"));
      }
    } else {
      return Failure(Exception("Login failed"));
    }
  }
}
