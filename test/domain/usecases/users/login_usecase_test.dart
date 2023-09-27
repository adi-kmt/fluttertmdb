import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:fluttertmdb/domain/usecases/users/login_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository authRepository;
  late LoginUserUsecase loginUserUsecase;

  setUpAll(() async {
    authRepository = MockAuthRepository();
    loginUserUsecase = LoginUserUsecase(authRepository: authRepository);
  });

  test("check success response", () async {
    final userModel = UserModel(email: "email", password: "password");
    provideDummy(ResponseWrapper<dynamic>.Success(true));

    when(authRepository.setLoggedInUser(userModel))
        .thenAnswer((inv) async => ResponseWrapper<dynamic>.Success(true));

    expect(await loginUserUsecase.call(userModel), isA<Success>());
  });

  test("check failure response", () async {
    final userModel = UserModel(email: "email", password: "password");

    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));
    provideDummy(ResponseWrapper.Success(true));

    when(authRepository.setLoggedInUser(userModel)).thenAnswer((inv) async =>
        ResponseWrapper.Failure(Exception("Something went wrong")));

    expect(await loginUserUsecase.call(userModel), isA<Failure>());
  });
}
