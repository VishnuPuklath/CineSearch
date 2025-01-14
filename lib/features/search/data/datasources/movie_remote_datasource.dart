import 'dart:convert';
import 'package:cinesearch/core/error/exception.dart';
import 'package:cinesearch/core/secrets/app_secrets.dart';
import 'package:cinesearch/features/search/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract interface class SearchRemoteDatasource {
  Future<List<MovieModel>> getAllSearchedMovies({required String query});
}

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  @override
  Future<List<MovieModel>> getAllSearchedMovies({required String query}) async {
    print('in the remote data impl calling http');
    final url = Uri.parse(
        'http://www.omdbapi.com/?s=$query&apikey=${AppSecrets.apiKey}');
    print(url);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Check for valid response and successful 'Response' flag from OMDb
        if (data['Response'] == "True") {
          final List results = data['Search'];

          return results
              .map((movie) => MovieModel.fromMap({
                    'title': movie['Title'],
                    'poster': movie['Poster'],
                    'releaseDate': movie['Year'],
                    'type': movie['Type'],
                  }))
              .toList();
        } else {
          // If the response from OMDb indicates an error, handle it more gracefully
          throw ServerException(data['Error'] ?? 'Unknown error occurred');
        }
      } else {
        // Handle non-200 HTTP status codes here
        throw const ServerException('Failed to fetch movies from OMDb');
      }
    } catch (e) {
      // Return a more detailed error message
      throw ServerException('Error fetching movies: ${e.toString()}');
    }
  }
}
