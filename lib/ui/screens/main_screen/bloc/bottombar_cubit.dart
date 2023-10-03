import 'package:bloc/bloc.dart';

class BottombarCubit extends Cubit<int> {
  BottombarCubit() : super(0);

  void selectIndex(int index) => emit(index);
}
