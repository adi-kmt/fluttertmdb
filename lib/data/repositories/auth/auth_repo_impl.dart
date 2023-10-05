import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/firebase_auth_source.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

import '../../../domain/models/user_model_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalSource authLocalSource;
  final FirebaseAuthSource firebaseAuthSource;

  AuthRepositoryImpl(
      {required this.authLocalSource, required this.firebaseAuthSource});

  @override
  Future<ResponseWrapper> clearLoggedInUser() async {
    final result = await firebaseAuthSource.logout();
    if (result is Success) {
      final isSuccess = await authLocalSource.clearLoggedInUser();
      if (isSuccess is Success) {
        return const Success(true);
      } else {
        return Failure(Exception("Logout failed"));
      }
    } else {
      return Failure(Exception("Logout failed"));
    }
  }

  @override
  Future<ResponseWrapper<UserModel>> getCurrentUser() async {
    final result = await firebaseAuthSource.checkLoggedInUser();
    if (result is Success) {
      final isSuccess = await authLocalSource.getCurrentUser();
      if (isSuccess is Success) {
        return Success((isSuccess as Success).data as UserModel);
      } else {
        return Failure(Exception("No user found"));
      }
    } else {
      return Failure(Exception("No user found"));
    }
  }

  @override
  Future<ResponseWrapper> setLoggedInUser(UserModel user) async {
    final result = await firebaseAuthSource.login(user);
    if (result is Success) {
      final isSuccess = await authLocalSource.setLoggedInUser(user);
      if (isSuccess is Success) {
        return const Success(null);
      } else {
        return Failure(Exception("Login failed"));
      }
    } else {
      return Failure(Exception("Login failed"));
    }
  }
}
