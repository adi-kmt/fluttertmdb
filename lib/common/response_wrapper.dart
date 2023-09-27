import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/response_wrapper.freezed.dart';

@freezed
sealed class ResponseWrapper<T> with _$ResponseWrapper {
  const factory ResponseWrapper.Success(T data) = Success;

  const factory ResponseWrapper.Failure(Exception exception) = Failure;
}
