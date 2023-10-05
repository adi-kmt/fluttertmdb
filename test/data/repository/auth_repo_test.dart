import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/data/repositories/auth/auth_repo_impl.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/firebase_auth_source.dart';
import 'package:fluttertmdb/domain/models/user_model_entity.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_test.mocks.dart';

@GenerateMocks([AuthLocalSource, FirebaseAuthSource, UserModel])
void main() {
  late AuthLocalSource authLocalSource;
  late FirebaseAuthSource firebaseAuthSource;
  late AuthRepository authRepository;
  late UserModel user;

  setUpAll(() {
    authLocalSource = MockAuthLocalSource();
    firebaseAuthSource = MockFirebaseAuthSource();
    authRepository = AuthRepositoryImpl(
        authLocalSource: authLocalSource,
        firebaseAuthSource: firebaseAuthSource);
    user = MockUserModel();
    provideDummy(ResponseWrapper<UserModel>.Success(user));
    provideDummy(ResponseWrapper<dynamic>.Success(null));
    provideDummy(ResponseWrapper<bool>.Success(true));
  });

  test("check logged in user success", () async {
    when(authLocalSource.setLoggedInUser(user))
        .thenAnswer((realInvocation) async => Success(null));

    when(firebaseAuthSource.login(user))
        .thenAnswer((realInvocation) async => Success(user));

    final response = await authRepository.setLoggedInUser(user);

    expect(response, isA<Success>());
  });

  test("check user success", () async {
    when(authLocalSource.getCurrentUser())
        .thenAnswer((realInvocation) async => Success(user));

    when(firebaseAuthSource.checkLoggedInUser())
        .thenAnswer((realInvocation) async => Success(user));

    final response = await authRepository.getCurrentUser();

    expect(response, isA<Success>());
  });

  test("check logged out user success", () async {
    when(authLocalSource.clearLoggedInUser())
        .thenAnswer((realInvocation) async => Success(null));

    when(firebaseAuthSource.logout())
        .thenAnswer((realInvocation) async => Success(true));

    final response = await authRepository.clearLoggedInUser();

    expect(response, isA<Success>());
  });

  test("check logged in user fail", () async {
    when(authLocalSource.setLoggedInUser(user))
        .thenAnswer((realInvocation) async => Success(null));

    when(firebaseAuthSource.login(user)).thenAnswer(
        (realInvocation) async => Failure(Exception("Something went wrong")));

    final response = await authRepository.setLoggedInUser(user);

    expect(response, isA<Failure>());
  });

  test("check user fail", () async {
    when(authLocalSource.getCurrentUser())
        .thenAnswer((realInvocation) async => Success(user));

    when(firebaseAuthSource.checkLoggedInUser()).thenAnswer(
        (realInvocation) async => Failure(Exception("Something went wrong")));

    final response = await authRepository.getCurrentUser();

    expect(response, isA<Failure>());
  });

  test("check logged out user fail", () async {
    when(authLocalSource.clearLoggedInUser())
        .thenAnswer((realInvocation) async => Success(null));

    when(firebaseAuthSource.logout()).thenAnswer(
        (realInvocation) async => Failure(Exception("Something went wrong")));

    final response = await authRepository.clearLoggedInUser();

    expect(response, isA<Failure>());
  });
}
