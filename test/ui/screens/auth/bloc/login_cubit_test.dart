import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/user_model.dart';
import 'package:fluttertmdb/domain/usecases/users/login_user_usecase.dart';
import 'package:fluttertmdb/ui/screens/auth/bloc/login_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_cubit_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<LoginUserUsecase>(onMissingStub: OnMissingStub.returnDefault)])
void main() {
  late final LoginCubit loginCubit;
  late final LoginUserUsecase loginUserUsecase;

  setUpAll(() {
    loginUserUsecase = MockLoginUserUsecase();
    loginCubit = LoginCubit(loginUsecase: loginUserUsecase);
    provideDummy(const ResponseWrapper<dynamic>.Success(true));
  });

  test("Check initial state", () {
    expect(loginCubit.state, UIState.initial());
  });

  blocTest("Check success",
      setUp: () async {
        when(loginUserUsecase
                .call(UserModel(email: "email", password: "password")))
            .thenAnswer(
                (invocation) async => const ResponseWrapper.Success(true));
      },
      build: () => loginCubit,
      act: (cubit) => cubit.login("email", "password"),
      expect: () => <UIState>[UIState.loading(), UIState.success(true)]);

  blocTest("Check failure",
      setUp: () async {
        when(loginUserUsecase
                .call(UserModel(email: "email", password: "password")))
            .thenAnswer(
                (invocation) async => const ResponseWrapper.Success(true));
      },
      build: () => loginCubit,
      act: (cubit) => cubit.login("email", "password"),
      expect: () => <UIState>[UIState.loading(), UIState.success(true)]);
}
