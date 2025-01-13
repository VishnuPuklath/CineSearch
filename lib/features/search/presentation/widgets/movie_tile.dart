// widgets/movie_tile.dart
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/presentation/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              MovieDetailPage.routeName,
              arguments: movie, // Passing the movie object
            );
          },
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.poster,
              width: 80,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, color: Colors.white60);
              },
            ),
          ),
          title: Text(
            movie.title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Text(
            movie.releaseDate,
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
