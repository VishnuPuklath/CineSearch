import 'package:cinesearch/core/error/exception.dart';
import 'package:cinesearch/core/error/failure.dart';
import 'package:cinesearch/features/search/data/datasources/movie_remote_datasource.dart';
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/domain/repositories/search_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDatasource remoteDatasource;

  SearchRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Movie>>> getAllSearchedMovies(
      {required String query}) async {
    try {
      final movies = await remoteDatasource.getAllSearchedMovies(query: query);

      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
