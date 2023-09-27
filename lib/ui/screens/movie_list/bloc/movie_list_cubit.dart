import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_all_movies_usecase.dart';

class MovieListCubit extends Cubit<UIState<List<MovieModel>>> {
  final GetAllMoviesUseCase getAllMoviesUseCase;

  MovieListCubit({required this.getAllMoviesUseCase})
      : super(const UIState.initial());

  void getAllMovies() async {
    emit(const UIState.loading());
    handleResponse(await getAllMoviesUseCase.call());
  }

  void handleResponse(ResponseWrapper<List<MovieModel>> response) async {
    switch (response) {
      case Success<List<MovieModel>>():
        {
          emit(UIState.success(response.data));
        }
      case Failure<List<MovieModel>>():
        {
          emit(UIState.uifailure(response.exception));
        }
    }
  }
}
