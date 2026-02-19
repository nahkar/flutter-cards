import 'package:cards/features/movies/data/datasources/movies_datasource.dart';
import 'package:cards/features/movies/domain/entities/movie.dart';
import 'package:cards/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getMovies() async {
    final models = await datasource.getMovies();
    return models.map((e) => e.toEntity()).toList();
  }
}