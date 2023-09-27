import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/ui_state.freezed.dart';

@freezed
sealed class UIState<T> with _$UIState {
  const factory UIState.success(T data) = Sucess;

  const factory UIState.loading() = Loading;

  const factory UIState.initial() = Initial;

  const factory UIState.uifailure(Exception exception) = UiFailure;
}
