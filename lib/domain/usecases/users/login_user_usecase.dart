import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';

import '../../models/user_model_entity.dart';

class LoginUserUsecase {
  final AuthRepository authRepository;

  LoginUserUsecase({required this.authRepository});

  Future<ResponseWrapper> call(UserModel userModel) {
    return authRepository.setLoggedInUser(userModel);
  }
}
