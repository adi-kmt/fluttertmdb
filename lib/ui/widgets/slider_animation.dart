import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/domain/models/movie_model.dart';
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:go_router/go_router.dart';

class ArtistCard extends StatelessWidget {
  final MovieModel movie;
  final int index;

  const ArtistCard(this.movie, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(movieDetailsRoute, extra: movie);
      },
      child: SizedBox(
        height: 350,
        // margin: EdgeInsets.only(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final int index;
  final String image;
  final double pageValue;

  const ImageSlider({
    Key? key,
    required this.index,
    required this.image,
    required this.pageValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(progress: getProgress()),
      child: CachedNetworkImage(
        imageUrl: image,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  double getProgress() {
    if (index == pageValue.floor()) {
      return 1.0 - (pageValue - index);
    } else if (index < pageValue.floor()) {
      return 0.0;
    } else {
      return 1.0;
    }
  }
}

class ImageClipper extends CustomClipper<Path> {
  ImageClipper({required this.progress});

  final double progress;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
      Rect.fromLTRB(
        size.width - (size.width * progress),
        0,
        size.width,
        size.height,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallback = void Function(int index);

class AnimatedPages extends StatelessWidget {
  final PageController pageController;
  final double pageValue;
  final ChildBuilder child;
  final int pageCount;
  final OnPageChangeCallback pageChangeCallback;

  const AnimatedPages({
    Key? key,
    required this.pageController,
    required this.pageValue,
    required this.child,
    required this.pageCount,
    required this.pageChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: pageChangeCallback,
        physics: const ClampingScrollPhysics(),
        controller: pageController,
        itemCount: pageCount,
        itemBuilder: (context, index) {
          if (index == pageValue.floor() + 1 ||
              index == pageValue.floor() + 2) {
            return Transform.translate(
              offset: Offset(0.0, 100 * (index - pageValue)),
              child: child(index, context),
            );
          } else if (index == pageValue.floor() ||
              index == pageValue.floor() - 1) {
            return Transform.translate(
              offset: Offset(0.0, 100 * (pageValue - index)),
              child: child(index, context),
            );
          } else {
            return child(index, context);
          }
        },
      ),
    );
  }
}
