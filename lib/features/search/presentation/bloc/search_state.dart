part of 'search_bloc.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;

  SearchLoaded({required this.movies});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
