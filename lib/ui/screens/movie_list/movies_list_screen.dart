// Inspired from the PR - https://github.com/mutualmobile/flutter_animations_example/pull/17

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/common/ui_state.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/screens/movie_list/bloc/movie_list_cubit.dart';
import 'package:fluttertmdb/ui/utils/colour_util.dart';
import 'package:fluttertmdb/ui/utils/typography.dart';
import 'package:fluttertmdb/ui/widgets/slider_animation.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final cubit = MovieListCubit(getAllMoviesUseCase: get_it.getItInstance());
  late PageController _pageController;

  // late List<MovieModel> movies;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
    cubit.getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<MovieListCubit, UIState>(builder: (context, state) {
          if (state is Sucess) {
            final movies = state.data as List<MovieModel>;
            final reversedMovies = movies.reversed.toList();
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Stack(
                    children: reversedMovies.map((movie) {
                      return ImageSlider(
                        pageValue: pageValue,
                        image:
                            "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                        index: movies.indexOf(movie),
                      );
                    }).toList(),
                  ),
                  AnimatedPages(
                    pageValue: pageValue,
                    pageController: _pageController,
                    pageCount: movies.length,
                    pageChangeCallback: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: (index, _) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 150.0),
                      child: Stack(alignment: Alignment.topCenter, children: [
                        ArtistCard(movies[index], index),
                        Positioned(
                          bottom: 90,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(movies[index].title,
                                style: TypographyTmdb.mainHeading
                                    .copyWith(color: ColourUtil.textHighlight)),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: SizedBox(
                              width: 300,
                              child: Text(movies[index].overview,
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  style: TypographyTmdb.desc.copyWith(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis)),
                            ))
                      ]),
                    ),
                  ),
                  const Positioned(top: 50, child: Text("Trending"))
                ],
              ),
            );
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final error = state is UiFailure
                ? state.exception.toString()
                : "No Items found";
            return Center(child: Text("$error has occurred"));
          }
        }));
  }
}
