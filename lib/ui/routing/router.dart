import 'package:fluttertmdb/ui/screens/auth/auth_screen.dart';
import 'package:fluttertmdb/ui/screens/movie_favourite/movie_favourite_screen.dart';
import 'package:fluttertmdb/ui/screens/movie_list/movies_list_screen.dart';
import 'package:fluttertmdb/ui/screens/on_boarding/onboarding_screen.dart';
import 'package:fluttertmdb/ui/screens/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

const authRoute = "/auth";
const moviesListRoute = "/movies";
const moviesFavouriteRoute = "/favourite";
const settingsRoute = "/settings";
const onboardingRoute = "/";

final tmdbRoutes = GoRouter(routes: [
  getOnboardingRoute(),
  getAuthRoute(),
  getMoviesFavouriteRoute(),
  getMoviesListRoute(),
  getSettingsRoute()
]);

GoRoute getOnboardingRoute() => GoRoute(
    path: onboardingRoute,
    builder: (context, state) => const OnboardingScreen());

GoRoute getAuthRoute() =>
    GoRoute(path: authRoute, builder: (context, state) => const AuthScreen());

GoRoute getMoviesFavouriteRoute() => GoRoute(
    path: moviesFavouriteRoute,
    builder: (context, state) => const MovieFavouriteScreen());

GoRoute getMoviesListRoute() => GoRoute(
    path: moviesListRoute,
    builder: (context, state) => const MoviesListScreen());

GoRoute getSettingsRoute() => GoRoute(
    path: settingsRoute, builder: (context, state) => const SettingsScreen());
