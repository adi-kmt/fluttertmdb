import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

class LogoutUserUsecase {
  final AuthRepository authRepository;

  LogoutUserUsecase({required this.authRepository});

  Future<ResponseWrapper> call() {
    return authRepository.clearLoggedInUser();
  }
}
