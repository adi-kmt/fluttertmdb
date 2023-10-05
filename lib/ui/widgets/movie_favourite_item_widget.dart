import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/ui/utils/typography.dart';

class MovieFavouriteItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const MovieFavouriteItemWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
                imageUrl: "http://image.tmdb.org/t/p/w500/$imagePath",
                height: 75,
                width: 75,
                fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TypographyTmdb.desc,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TypographyTmdb.desc,
                  ),
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios_sharp)
          ],
        ));
  }
}
