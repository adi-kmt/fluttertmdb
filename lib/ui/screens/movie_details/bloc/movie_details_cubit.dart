import 'package:bloc/bloc.dart';
import 'package:fluttertmdb/common/response_wrapper.dart';
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/domain/usecases/movies/add_favourite_movie_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/check_if_movie_is_favourite_usecase.dart';
import 'package:fluttertmdb/domain/usecases/movies/delete_favourite_movie_usecase.dart';

class MovieDetailsCubit extends Cubit<UIState<bool>> {
  final AddFavouriteMovieUsecase addFavouriteMovieUsecase;
  final DeleteFavouriteMovieUsecase deleteFavouriteMovieUsecase;
  final CheckIfMovieIsFavouriteUsecase checkIfMovieIsFavouriteUsecase;

  MovieDetailsCubit({
    required this.addFavouriteMovieUsecase,
    required this.deleteFavouriteMovieUsecase,
    required this.checkIfMovieIsFavouriteUsecase,
  }) : super(const UIState.initial());

  void checkIfMovieIsFavourite(int id) async {
    emit(const UIState.loading());
    handleResponse(await checkIfMovieIsFavouriteUsecase.call(id), true);
  }

  void addFavouriteMovie(MovieModel movieModel) async {
    emit(const UIState.loading());
    handleResponse(await addFavouriteMovieUsecase.call(movieModel), true);
  }

  void removeFavouriteMovie(int id) async {
    emit(const UIState.loading());
    handleResponse(await deleteFavouriteMovieUsecase.call(id), false);
  }

  void handleResponse(ResponseWrapper response, bool isFavourite) {
    switch (response) {
      case Success():
        {
          emit(UIState.success(isFavourite));
        }
      case Failure():
        {
          emit(UiFailure(response.exception));
        }
    }
  }
}
