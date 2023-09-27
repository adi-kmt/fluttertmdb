import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/usecases/users/login_user_usecase.dart';
import 'package:fluttertmdb/ui/screens/auth/bloc/login_cubit.dart';
import 'package:mockito/annotations.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginUserUsecase])
void main() {
  late final LoginCubit loginCubit;
  late final LoginUserUsecase loginUserUsecase;

  setUpAll(() {
    loginUserUsecase = MockLoginUserUsecase();
    loginCubit = LoginCubit(loginUsecase: loginUserUsecase);
  });

  test("Check initial state", () {
    expect(loginCubit.state, UIState.initial());
  });

  // blocTest("Check state",
  //     build: () => loginCubit,
  //     act: (cubit) => cubit.login("email", "password"),
  //     setUp: () {
  //       {
  //         provideDummy(ResponseWrapper.Success(true));
  //         when(loginUserUsecase
  //                 .call(UserModel(email: "email", password: "password")))
  //             .thenAnswer((invocation) async => ResponseWrapper.Success(true));
  //       }
  //     },
  //     expect: () => <UIState>[UIState.initial()]);
}
