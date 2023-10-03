import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/usecases/users/login_user_usecase.dart';

import '../../../../domain/models/user_model_entity.dart';

class LoginCubit extends Cubit<UIState> {
  final LoginUserUsecase loginUsecase;

  LoginCubit({required this.loginUsecase}) : super(const UIState.initial());

  void login(String email, String password) async {
    emit(const UIState.loading());
    handleResponse(
        await loginUsecase.call(UserModel.fromUser(email, password)));
  }

  void handleResponse(ResponseWrapper call) async {
    switch (call) {
      case Success():
        {
          emit(UIState.success(call.data));
        }
      case Failure():
        {
          emit(UIState.uifailure(call.exception));
        }
    }
  }
}
