import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({required this.authRepository});

  Future<ResponseWrapper<UserModel>> call() {
    return authRepository.getCurrentUser();
  }
}
