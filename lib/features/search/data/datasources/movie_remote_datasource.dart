import 'dart:convert';

import 'package:cinesearch/core/error/exception.dart';
import 'package:cinesearch/core/secrets/app_secrets.dart';
import 'package:cinesearch/features/search/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract interface class SearchRemoteDatasource {
  Future<List<MovieModel>> getAllSearchedMovies({required String query});
}

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  final http.Client client;

  SearchRemoteDatasourceImpl({required this.client});
  @override
  Future<List<MovieModel>> getAllSearchedMovies({required String query}) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=${AppSecrets.apiKey}&query=$query');
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];

        return results
            .map((movie) => MovieModel.fromMap({
                  'title': movie['title'],
                  'poster': movie['poster_path'],
                  'releaseDate': movie['release_date'],
                }))
            .toList();
      } else {
        throw const ServerException('Failed to fetch movies');
      }
    } catch (e) {
      throw ServerException('Error fetching movies: $e');
    }
  }
}
