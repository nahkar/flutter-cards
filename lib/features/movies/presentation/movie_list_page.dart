import 'package:cards/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:cards/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:cards/features/movies/domain/entities/movie.dart';
import 'package:cards/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = MoviesRemoteDatasource(http.Client());
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
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Html(data: movie.summary),
                      ],
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
