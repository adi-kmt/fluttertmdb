import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/screens/auth/auth_screen.dart';
import 'package:fluttertmdb/ui/screens/main_screen/main_screen.dart';
import 'package:fluttertmdb/ui/screens/movie_details/movie_details.screen.dart';
import 'package:fluttertmdb/ui/screens/movie_favourite/movie_favourite_screen.dart';
import 'package:fluttertmdb/ui/screens/movie_list/movies_list_screen.dart';
import 'package:fluttertmdb/ui/screens/on_boarding/onboarding_screen.dart';
import 'package:fluttertmdb/ui/screens/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

const authRoute = "/auth";
const mainRoute = "/main";
const moviesListRoute = "/movies";
const movieDetailsRoute = "/details";
const moviesFavouriteRoute = "/favourite";
const settingsRoute = "/settings";
const onboardingRoute = "/";

final tmdbRoutes = GoRouter(routes: <RouteBase>[
  getOnboardingRoute(),
  getAuthRoute(),
  getMoviesFavouriteRoute(),
  getMoviesListRoute(),
  getSettingsRoute(),
  getMovieDetailsRoute(),
  getMainScreenRoute()
]);

GoRoute getOnboardingRoute() => GoRoute(
    path: onboardingRoute,
    name: onboardingRoute,
    builder: (context, state) => const OnboardingScreen());

GoRoute getMainScreenRoute() => GoRoute(
    path: mainRoute,
    name: mainRoute,
    builder: (context, state) => const MainScreen());

GoRoute getAuthRoute() => GoRoute(
    path: authRoute,
    name: authRoute,
    builder: (context, state) => const AuthScreen());

GoRoute getMoviesFavouriteRoute() => GoRoute(
    path: moviesFavouriteRoute,
    name: moviesFavouriteRoute,
    builder: (context, state) => const MovieFavouriteScreen());

GoRoute getMoviesListRoute() => GoRoute(
    path: moviesListRoute,
    name: moviesListRoute,
    builder: (context, state) => const MovieListScreen());

GoRoute getMovieDetailsRoute() => GoRoute(
    path: movieDetailsRoute,
    name: movieDetailsRoute,
    builder: (context, state) {
      MovieModel movie = state.extra as MovieModel;
      return MovieDetailsScreen(movie: movie);
    });

GoRoute getSettingsRoute() => GoRoute(
    path: settingsRoute,
    name: settingsRoute,
    builder: (context, state) => const SettingsScreen());
