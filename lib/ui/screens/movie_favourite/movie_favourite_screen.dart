import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/screens/movie_favourite/bloc/movie_favourite_cubit.dart';
import 'package:fluttertmdb/ui/widgets/movie_favourite_item_widget.dart';
import 'package:go_router/go_router.dart';

class MovieFavouriteScreen extends StatelessWidget {
  const MovieFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =
        MovieFavouriteCubit(getFavouriteMoviesUseCase: get_it.getItInstance());

    return BlocProvider(
      create: (context) => cubit,
      child:
          BlocBuilder<MovieFavouriteCubit, UIState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Sucess) {
          final movies = state.data as List<MovieModel>;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(movieDetailsRoute, extra: movies[index]);
                },
                child: MovieFavouriteItemWidget(
                  imagePath: movies[index].posterPath,
                  title: movies[index].title,
                  description: movies[index].overview,
                ),
              );
            },
          );
        } else if (state is Initial) {
          cubit.getFavouriteMoviesResponse();
          return const Center(child: Text("Items being fetched"));
        } else {
          return const Center(child: Text("No Items found"));
        }
      }),
    );
  }
}
