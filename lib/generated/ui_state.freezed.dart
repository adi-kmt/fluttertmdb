// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../common/ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UIState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Exception exception) uifailure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(Exception exception)? uifailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Exception exception)? uifailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Sucess<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Initial<T> value) initial,
    required TResult Function(UiFailure<T> value) uifailure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Sucess<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(UiFailure<T> value)? uifailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Sucess<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Initial<T> value)? initial,
    TResult Function(UiFailure<T> value)? uifailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStateCopyWith<T, $Res> {
  factory $UIStateCopyWith(UIState<T> value, $Res Function(UIState<T>) then) =
      _$UIStateCopyWithImpl<T, $Res, UIState<T>>;
}

/// @nodoc
class _$UIStateCopyWithImpl<T, $Res, $Val extends UIState<T>>
    implements $UIStateCopyWith<T, $Res> {
  _$UIStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SucessCopyWith<T, $Res> {
  factory _$$SucessCopyWith(
          _$Sucess<T> value, $Res Function(_$Sucess<T>) then) =
      __$$SucessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SucessCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$Sucess<T>>
    implements _$$SucessCopyWith<T, $Res> {
  __$$SucessCopyWithImpl(_$Sucess<T> _value, $Res Function(_$Sucess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Sucess<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Sucess<T> implements Sucess<T> {
  const _$Sucess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'UIState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Sucess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucessCopyWith<T, _$Sucess<T>> get copyWith =>
      __$$SucessCopyWithImpl<T, _$Sucess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Exception exception) uifailure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(Exception exception)? uifailure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Exception exception)? uifailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Sucess<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Initial<T> value) initial,
    required TResult Function(UiFailure<T> value) uifailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Sucess<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(UiFailure<T> value)? uifailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Sucess<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Initial<T> value)? initial,
    TResult Function(UiFailure<T> value)? uifailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Sucess<T> implements UIState<T> {
  const factory Sucess(final T data) = _$Sucess<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SucessCopyWith<T, _$Sucess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'UIState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Exception exception) uifailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(Exception exception)? uifailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Exception exception)? uifailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Sucess<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Initial<T> value) initial,
    required TResult Function(UiFailure<T> value) uifailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Sucess<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(UiFailure<T> value)? uifailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Sucess<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Initial<T> value)? initial,
    TResult Function(UiFailure<T> value)? uifailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements UIState<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$InitialCopyWith<T, $Res> {
  factory _$$InitialCopyWith(
          _$Initial<T> value, $Res Function(_$Initial<T>) then) =
      __$$InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$Initial<T>>
    implements _$$InitialCopyWith<T, $Res> {
  __$$InitialCopyWithImpl(
      _$Initial<T> _value, $Res Function(_$Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial<T> implements Initial<T> {
  const _$Initial();

  @override
  String toString() {
    return 'UIState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Exception exception) uifailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(Exception exception)? uifailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Exception exception)? uifailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Sucess<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Initial<T> value) initial,
    required TResult Function(UiFailure<T> value) uifailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Sucess<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(UiFailure<T> value)? uifailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Sucess<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Initial<T> value)? initial,
    TResult Function(UiFailure<T> value)? uifailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements UIState<T> {
  const factory Initial() = _$Initial<T>;
}

/// @nodoc
abstract class _$$UiFailureCopyWith<T, $Res> {
  factory _$$UiFailureCopyWith(
          _$UiFailure<T> value, $Res Function(_$UiFailure<T>) then) =
      __$$UiFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$UiFailureCopyWithImpl<T, $Res>
    extends _$UIStateCopyWithImpl<T, $Res, _$UiFailure<T>>
    implements _$$UiFailureCopyWith<T, $Res> {
  __$$UiFailureCopyWithImpl(
      _$UiFailure<T> _value, $Res Function(_$UiFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$UiFailure<T>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$UiFailure<T> implements UiFailure<T> {
  const _$UiFailure(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'UIState<$T>.uifailure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiFailure<T> &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiFailureCopyWith<T, _$UiFailure<T>> get copyWith =>
      __$$UiFailureCopyWithImpl<T, _$UiFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Exception exception) uifailure,
  }) {
    return uifailure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(Exception exception)? uifailure,
  }) {
    return uifailure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Exception exception)? uifailure,
    required TResult orElse(),
  }) {
    if (uifailure != null) {
      return uifailure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Sucess<T> value) success,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Initial<T> value) initial,
    required TResult Function(UiFailure<T> value) uifailure,
  }) {
    return uifailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Sucess<T> value)? success,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(UiFailure<T> value)? uifailure,
  }) {
    return uifailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Sucess<T> value)? success,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Initial<T> value)? initial,
    TResult Function(UiFailure<T> value)? uifailure,
    required TResult orElse(),
  }) {
    if (uifailure != null) {
      return uifailure(this);
    }
    return orElse();
  }
}

abstract class UiFailure<T> implements UIState<T> {
  const factory UiFailure(final Exception exception) = _$UiFailure<T>;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$UiFailureCopyWith<T, _$UiFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
