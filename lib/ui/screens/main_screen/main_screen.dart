import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/screens/main_screen/bloc/bottombar_cubit.dart';
import 'package:fluttertmdb/ui/screens/movie_favourite/movie_favourite_screen.dart';
import 'package:fluttertmdb/ui/screens/movie_list/movies_list_screen.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottombarCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Main Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => context.pushNamed(settingsRoute),
            ),
          ],
        ),
        body: BlocBuilder<BottombarCubit, int>(
          builder: (context, index) {
            return index == 0 ? MovieListScreen() : MovieFavouriteScreen();
          },
        ),
        bottomNavigationBar: BlocBuilder<BottombarCubit, int>(
          builder: (context, index) {
            return BottomNavigationBar(
              currentIndex: index,
              onTap: (selectedIndex) =>
                  context.read<BottombarCubit>().selectIndex(selectedIndex),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_arrow_rounded),
                  label: 'Movies',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star_border),
                  label: 'Favorites',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
