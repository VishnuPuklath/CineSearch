import 'dart:async';
import 'package:cinesearch/core/common/widgets/loader.dart';
import 'package:cinesearch/features/search/domain/entitites/movie.dart';
import 'package:cinesearch/features/search/presentation/bloc/search_bloc.dart';
import 'package:cinesearch/features/search/presentation/widgets/build_error_widget.dart';
import 'package:cinesearch/features/search/presentation/widgets/empty_space_widget.dart';
import 'package:cinesearch/features/search/presentation/widgets/movie_tile.dart';
import 'package:cinesearch/features/search/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Horizontal padding for better layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search TextField
              CustomSearchBar(
                controller: controller,
                onChanged: (query) {
                  context
                      .read<SearchBloc>()
                      .add(SearchMoviesEvent(query: query));
                },
              ),
              const SizedBox(height: 12),
              // BlocBuilder to handle states
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(child: Loader());
                    } else if (state is SearchLoaded) {
                      final movies = state.movies;
                      if (movies.isEmpty) {
                        return const EmptySpaceWidget();
                      }

                      return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return MovieTile(movie: movie);
                        },
                      );
                    } else if (state is SearchError) {
                      return Center(
                        child: BuildErrorWidget(message: state.message),
                      );
                    }

                    return const Center(
                        child: Text('Start searching for movies!',
                            style: TextStyle(color: Colors.white)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
