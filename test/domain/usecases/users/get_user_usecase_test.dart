import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/user_model_entity.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:fluttertmdb/domain/usecases/users/get_current_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository authRepository;
  late GetCurrentUserUsecase getCurrentUserUsecase;

  setUpAll(() async {
    authRepository = MockAuthRepository();
    getCurrentUserUsecase =
        GetCurrentUserUsecase(authRepository: authRepository);
  });

  test("check success response", () async {
    final userModel = UserModel.fromUser("email", "password");
    provideDummy(ResponseWrapper<UserModel>.Success(userModel));

    when(authRepository.getCurrentUser())
        .thenAnswer((inv) async => ResponseWrapper.Success(userModel));

    expect(await getCurrentUserUsecase.call(), isA<Success>());
  });

  test("check failure response", () async {
    final userModel = UserModel.fromUser("email", "password");

    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));
    provideDummy(ResponseWrapper<UserModel>.Success(userModel));

    when(authRepository.getCurrentUser())
        .thenAnswer((inv) async => ResponseWrapper.Failure(Exception()));

    expect(await getCurrentUserUsecase.call(), isA<Failure>());
  });
}
