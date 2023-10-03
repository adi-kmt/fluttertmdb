import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/user_model_entity.dart';
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
  });

  test("Check initial state", () {
    expect(loginCubit.state, isA<Initial>());
  });

  blocTest("Check success",
      setUp: () async {
        provideDummy(const ResponseWrapper<dynamic>.Success(true));
        when(loginUserUsecase.call(UserModel.fromUser("email", "password")))
            .thenAnswer(
                (invocation) async => const ResponseWrapper.Success(true));
      },
      build: () => loginCubit,
      act: (cubit) => cubit.login("email", "password"),
      expect: () => <Matcher>[isA<Loading>(), isA<Sucess>()]);

  blocTest("Check failure",
      setUp: () async {
        provideDummy(const ResponseWrapper<dynamic>.Success(true));
        provideDummy(
            ResponseWrapper.Failure(Exception("Something went wrong")));
        when(loginUserUsecase.call(UserModel.fromUser("email", "password")))
            .thenAnswer((invocation) async =>
                ResponseWrapper.Failure(Exception("Something went wrong")));
      },
      build: () => loginCubit,
      act: (cubit) => cubit.login("email", "password"),
      expect: () => <Matcher>[isA<Loading>(), isA<UiFailure>()]);
}
