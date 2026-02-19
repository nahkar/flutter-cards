import 'package:cards/features/movies/data/datasources/movies_mock_datasource.dart';
import 'package:cards/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:cards/features/movies/domain/entities/movie.dart';
import 'package:cards/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = MoviesMockDatasource();
    final repository = MoviesRepositoryImpl(datasource);
    final getMovies = GetMovies(repository);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final movies = snapshot.data ?? [];

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return Card(
                  child: ListTile(
                    title: Text(movie.title),
                    subtitle: Text(
                      '${movie.releaseDate.year} • Rating: ${movie.rating}',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
