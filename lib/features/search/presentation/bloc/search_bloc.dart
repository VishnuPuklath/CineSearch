import 'package:bloc/bloc.dart';
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/domain/usecases/get_all_searched_movies.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetAllSearchedMoviesUsecase _getAllSearchedMoviesUsecase;
  SearchBloc({required GetAllSearchedMoviesUsecase getAllSearchedMoviesUsecase})
      : _getAllSearchedMoviesUsecase = getAllSearchedMoviesUsecase,
        super(SearchInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      emit(SearchLoading());
      final result =
          await _getAllSearchedMoviesUsecase(SearchParams(query: event.query));
      result.fold(
        (failure) => emit(SearchError(message: failure.message)),
        (movies) => emit(SearchLoaded(movies: movies)),
      );
    });
  }
}
