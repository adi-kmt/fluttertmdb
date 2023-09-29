import 'package:fluttertmdb/data/repositories/auth/auth_repo_impl.dart';
import 'package:fluttertmdb/data/sources/local/auth_local_source.dart';
import 'package:fluttertmdb/data/sources/remote/firebase_auth_source.dart';
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:test/scaffolding.dart';

import 'auth_repo_test.mocks.dart';

@GenerateMocks([AuthLocalSource, FirebaseAuthSource])
void main() {
  late AuthLocalSource authLocalSource;
  late FirebaseAuthSource firebaseAuthSource;
  late AuthRepository authRepository;

  setUpAll(() {
    authLocalSource = MockAuthLocalSource();
    firebaseAuthSource = MockFirebaseAuthSource();
    authRepository = AuthRepositoryImpl(
        authLocalSource: authLocalSource,
        firebaseAuthSource: firebaseAuthSource);
  });

  // test("check loggedin user success", () {
  //
  // });
}
