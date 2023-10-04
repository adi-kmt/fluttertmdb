import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/screens/movie_details/bloc/movie_details_cubit.dart';

import '../../../common/ui_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieModel? movie;

  MovieDetailsScreen({super.key, this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool isFavourite = false;
  final cubit = MovieDetailsCubit(
      addFavouriteMovieUsecase: get_it.getItInstance(),
      deleteFavouriteMovieUsecase: get_it.getItInstance(),
      checkIfMovieIsFavouriteUsecase: get_it.getItInstance());

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MovieDetailsCubit, UIState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Initial) {
            cubit.checkIfMovieIsFavourite(movie?.id ?? 0);
            return const SnackBar(content: Text("Movie Is being fetched"));
          } else if (state is Sucess) {
            final _isFavourite = state.data as bool;
            isFavourite = _isFavourite;
          }
          return Scaffold(
            appBar: AppBar(
                toolbarOpacity: 0,
                iconTheme: const IconThemeData(
                  color: Color(0xff211F26),
                )),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0), // 10 pixels below app bar
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 225.0,
                          child: CachedNetworkImage(
                              imageUrl:
                                  "http://image.tmdb.org/t/p/w500/${movie?.posterPath}",
                              // Replace with the movie's image URL
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(flex: 2),
                              Text(
                                movie?.title ?? "",
                                style: const TextStyle(
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(flex: 1),
                              IconButton(
                                icon: isFavourite == true
                                    ? const Icon(Icons.star)
                                    : const Icon(Icons.star_border),
                                color: isFavourite == true
                                    ? const Color(0xff6750A4)
                                    : const Color(0xFF000000),
                                onPressed: () {
                                  if (isFavourite) {
                                    cubit.removeFavouriteMovie(movie?.id ?? 0);
                                  } else {
                                    cubit.addFavouriteMovie(movie!);
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  _buildInfoRow('Synopsis', movie?.overview ?? ""),
                  _buildInfoRow('Genre', movie?.originalLanguage ?? ""),
                  _buildInfoRow('Budget', movie?.releaseDate ?? ""),
                  _buildInfoRow('Revenue', movie?.originalLanguage ?? ""),
                  _buildInfoRow('Runtime', movie?.releaseDate ?? ""),
                  _buildInfoRow('Rating', movie?.voteCount.toString() ?? ""),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: RichText(
        textAlign: TextAlign.start,
        maxLines: 4,
        text: TextSpan(
          children: [
            if (title.isNotEmpty)
              TextSpan(
                text: '$title: ',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.deepPurple,
                ),
              ),
            TextSpan(
              text: content,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
