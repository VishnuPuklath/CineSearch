import 'package:cinesearch/features/search/domain/entitites/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.title,
      required super.poster,
      required super.releaseDate});

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] as String,
      poster: map['poster'] as String,
      releaseDate: map['releaseDate'] as String,
    );
  }
}
