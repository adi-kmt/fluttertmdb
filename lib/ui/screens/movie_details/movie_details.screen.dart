import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/screens/movie_details/bloc/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieModel? movie;

  MovieDetailsScreen({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    final cubit = MovieDetailsCubit(
        addFavouriteMovieUsecase: get_it.getItInstance(),
        deleteFavouriteMovieUsecase: get_it.getItInstance());

    return BlocProvider(
      create: (context) => cubit,
      child: SingleChildScrollView(
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
                    child: Image.network(
                      movie?.posterPath ?? "",
                      // Replace with the movie's image URL
                      fit: BoxFit.cover,
                    ),
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
                        const Icon(
                          Icons.favorite_border,
                          size: 36.0,
                          color: Colors.red,
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
  }

  Widget _buildInfoRow(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: RichText(
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
