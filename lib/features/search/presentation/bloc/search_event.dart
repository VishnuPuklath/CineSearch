part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchMoviesEvent extends SearchEvent {
  final String query;

  SearchMoviesEvent({required this.query});
}
