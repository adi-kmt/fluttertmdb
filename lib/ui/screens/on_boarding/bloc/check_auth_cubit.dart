import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/domain/usecases/users/get_current_user_usecase.dart';

import '../../../../domain/models/user_model_entity.dart';

class CheckAuthCubit extends Cubit<bool> {
  final GetCurrentUserUsecase getCurrentUserUsecase;

  CheckAuthCubit({required this.getCurrentUserUsecase}) : super(false);

  void checkIfUserIsLoggedIn() async {
    handleResponse(await getCurrentUserUsecase.call());
  }

  void handleResponse(ResponseWrapper<UserModel> call) {
    switch (call) {
      case Success():
        {
          emit(true);
        }
      case Failure():
        {
          emit(false);
        }
    }
  }
}
