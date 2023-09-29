import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0), // 10 pixels below app bar
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 150.0,
                  height: 225.0,
                  child: Image.network(
                    "movie.posterPath", // Replace with the movie's image URL
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(flex: 2),
                      Text(
                        "movie.title",
                        style: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(flex: 1),
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
          _buildInfoRow('Synopsis', "movie.synopsis"),
          _buildInfoRow('Genre', "movie.genre"),
          _buildInfoRow('Budget', "movie.budget"),
          _buildInfoRow('Revenue', "movie.revenue"),
          _buildInfoRow('Runtime', "movie.runtime"),
          _buildInfoRow('Rating', "movie.rating"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Container(
      margin: EdgeInsets.only(top: 8),
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
