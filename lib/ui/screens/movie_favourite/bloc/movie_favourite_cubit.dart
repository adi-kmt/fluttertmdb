import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/get_favourite_movies_usecase.dart';

class MovieFavouriteCubit extends Cubit<UIState<List<MovieModel>>> {
  final GetFavouriteMoviesUseCase getFavouriteMoviesUseCase;

  MovieFavouriteCubit({required this.getFavouriteMoviesUseCase})
      : super(const UIState.initial());

  void getFavouriteMoviesResponse() async {
    emit(const UIState.loading());
    handleResponse(await getFavouriteMoviesUseCase.call());
  }

  void handleResponse(ResponseWrapper<List<MovieModel>> call) {
    switch (call) {
      case Success<List<MovieModel>>():
        {
          emit(UIState.success(call.data));
        }
      case Failure<List<MovieModel>>():
        {
          emit(UIState.uifailure(call.exception));
        }
    }
  }
}
