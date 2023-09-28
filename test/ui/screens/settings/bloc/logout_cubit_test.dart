import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/usecases/users/logout_user_usecase.dart';
import 'package:fluttertmdb/ui/screens/settings/bloc/logout_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_cubit_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<LogoutUserUsecase>(onMissingStub: OnMissingStub.returnDefault)])
void main() {
  late final LogoutCubit logoutCubit;
  late final LogoutUserUsecase logoutUserUsecase;

  setUpAll(() {
    logoutUserUsecase = MockLogoutUserUsecase();
    logoutCubit = LogoutCubit(logoutUserUsecase: logoutUserUsecase);
  });

  test("Check initial state", () {
    expect(logoutCubit.state, isA<Initial>());
  });

  blocTest("Check success",
      setUp: () async {
        provideDummy(const ResponseWrapper<dynamic>.Success(true));
        when(logoutUserUsecase.call()).thenAnswer(
            (invocation) async => const ResponseWrapper.Success(true));
      },
      build: () => logoutCubit,
      act: (cubit) => cubit.logout(),
      expect: () => <Matcher>[isA<Loading>(), isA<Sucess>()]);

  blocTest("Check failure",
      setUp: () async {
        provideDummy(const ResponseWrapper<dynamic>.Success(true));
        provideDummy(
            ResponseWrapper.Failure(Exception("Something went wrong")));
        when(logoutUserUsecase.call()).thenAnswer((invocation) async =>
            ResponseWrapper.Failure(Exception("Something went wrong")));
      },
      build: () => logoutCubit,
      act: (cubit) => cubit.logout(),
      expect: () => <Matcher>[isA<Loading>(), isA<UiFailure>()]);
}
