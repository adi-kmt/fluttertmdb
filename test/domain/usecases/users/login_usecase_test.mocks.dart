// Mocks generated by Mockito 5.4.2 from annotations
// in fluttertmdb/test/domain/usecases/users/login_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fluttertmdb/common/response_wrapper.dart' as _i4;
import 'package:fluttertmdb/domain/models/user_model.dart' as _i5;
import 'package:fluttertmdb/domain/repositories/auth/auth_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i2.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ResponseWrapper<_i5.UserModel>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue: _i3.Future<_i4.ResponseWrapper<_i5.UserModel>>.value(
            _i6.dummyValue<_i4.ResponseWrapper<_i5.UserModel>>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<_i5.UserModel>>);
  @override
  _i3.Future<_i4.ResponseWrapper<dynamic>> setLoggedInUser(
          _i5.UserModel? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #setLoggedInUser,
          [user],
        ),
        returnValue: _i3.Future<_i4.ResponseWrapper<dynamic>>.value(
            _i6.dummyValue<_i4.ResponseWrapper<dynamic>>(
          this,
          Invocation.method(
            #setLoggedInUser,
            [user],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<dynamic>>);
  @override
  _i3.Future<_i4.ResponseWrapper<dynamic>> clearLoggedInUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #clearLoggedInUser,
          [],
        ),
        returnValue: _i3.Future<_i4.ResponseWrapper<dynamic>>.value(
            _i6.dummyValue<_i4.ResponseWrapper<dynamic>>(
          this,
          Invocation.method(
            #clearLoggedInUser,
            [],
          ),
        )),
      ) as _i3.Future<_i4.ResponseWrapper<dynamic>>);
}
