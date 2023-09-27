import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:fluttertmdb/domain/usecases/users/logout_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository authRepository;
  late LogoutUserUsecase logoutUserUsecase;

  setUpAll(() async {
    authRepository = MockAuthRepository();
    logoutUserUsecase = LogoutUserUsecase(authRepository: authRepository);
  });

  test("check success response", () async {
    provideDummy(ResponseWrapper<dynamic>.Success(true));

    when(authRepository.clearLoggedInUser())
        .thenAnswer((inv) async => ResponseWrapper<dynamic>.Success(true));

    expect(await logoutUserUsecase.call(), isA<Success>());
  });

  test("check failure response", () async {
    provideDummy(ResponseWrapper.Failure(Exception("Something went wrong")));
    provideDummy(ResponseWrapper.Success(true));

    when(authRepository.clearLoggedInUser()).thenAnswer((inv) async =>
        ResponseWrapper.Failure(Exception("Something went wrong")));

    expect(await logoutUserUsecase.call(), isA<Failure>());
  });
}
