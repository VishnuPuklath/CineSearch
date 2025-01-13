import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/presentation/screens/movie_detail_screen.dart';
import 'package:cinesearch/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case MovieDetailPage.routeName:
      final movie = settings.arguments as Movie;
      return MaterialPageRoute(
        builder: (context) => MovieDetailPage(movie: movie),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page Not Found')),
        ),
      );
  }
}
