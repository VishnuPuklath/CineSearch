// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinesearch/core/error/failure.dart';
import 'package:cinesearch/core/usecase/usecase.dart';
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/domain/repositories/search_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllSearchedMoviesUsecase
    implements UseCase<List<Movie>, SearchParams> {
  final SearchRepository searchRepository;
  GetAllSearchedMoviesUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, List<Movie>>> call(SearchParams params) {
    print('calling usecase');
    return searchRepository.getAllSearchedMovies(query: params.query);
  }
}

class SearchParams {
  String query;
  SearchParams({
    required this.query,
  });
}
