import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/usecases/users/logout_user_usecase.dart';

class LogoutCubit extends Cubit<UIState> {
  final LogoutUserUsecase logoutUserUsecase;

  LogoutCubit({required this.logoutUserUsecase})
      : super(const UIState.initial());

  void logout() async {
    emit(const UIState.loading());
    handleResponse(await logoutUserUsecase.call());
  }

  void handleResponse(ResponseWrapper<dynamic> responseWrapper) {
    switch (responseWrapper) {
      case Success():
        {
          emit(const UIState.success(null));
        }
      case Failure():
        {
          emit(UIState.uifailure(responseWrapper.exception));
        }
    }
  }
}
