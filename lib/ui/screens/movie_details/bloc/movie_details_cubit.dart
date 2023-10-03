import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/add_favourite_movie_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/delete_favourite_movie_usecase.dart';

class MovieDetailsCubit extends Cubit<UIState> {
  final AddFavouriteMovieUsecase addFavouriteMovieUsecase;
  final DeleteFavouriteMovieUsecase deleteFavouriteMovieUsecase;

  MovieDetailsCubit(
      {required this.addFavouriteMovieUsecase,
      required this.deleteFavouriteMovieUsecase})
      : super(const UIState.initial());

  void addFavouriteMovie(MovieModel movieModel) async {
    emit(const UIState.loading());
    handleResponse(await addFavouriteMovieUsecase.call(movieModel.id));
  }

  void removeFavouriteMovie(MovieModel movieModel) async {
    emit(const UIState.loading());
    handleResponse(
        await deleteFavouriteMovieUsecase.call(movieModel.toString()));
  }

  void handleResponse(ResponseWrapper response) {
    switch (response) {
      case Success():
        {
          emit(const UIState.success(null));
        }
      case Failure():
        {
          emit(UiFailure(response.exception));
        }
    }
  }
}
