import 'package:cinesearch/core/error/failure.dart';
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<Movie>>> getAllSearchedMovies(
      {required String query});
}
