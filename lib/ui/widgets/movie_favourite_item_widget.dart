import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/data/utils/api_utils.dart';

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
                imageUrl: ApiUtils.baseUrl + imagePath,
                height: 75,
                width: 75,
                fit: BoxFit.cover),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios_sharp)
          ],
        ));
  }
}
