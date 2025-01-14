import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/detail-screen';
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.poster,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 50);
              },
            ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Released: ${movie.releaseDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Type: ${movie.type}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
