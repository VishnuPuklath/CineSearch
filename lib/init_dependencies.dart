import 'package:cinesearch/features/search/data/datasources/movie_remote_datasource.dart';
import 'package:cinesearch/features/search/data/repositories/search_repository_impl.dart';
import 'package:cinesearch/features/search/domain/repositories/search_repository.dart';
import 'package:cinesearch/features/search/domain/usecases/get_all_searched_movies.dart';
import 'package:cinesearch/features/search/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSearch();
  serviceLocator.registerLazySingleton(() => http.Client);
}

void _initSearch() {
  //Datasource
  serviceLocator
    ..registerFactory<SearchRemoteDatasource>(
      () => SearchRemoteDatasourceImpl(client: serviceLocator()),
    )
    //repository
    ..registerFactory<SearchRepository>(
      () => SearchRepositoryImpl(remoteDatasource: serviceLocator()),
    )
    //usecases
    ..registerFactory(
      () => GetAllSearchedMoviesUsecase(searchRepository: serviceLocator()),
    )
    //bloc
    ..registerLazySingleton(
      () => SearchBloc(getAllSearchedMoviesUsecase: serviceLocator()),
    );
}
