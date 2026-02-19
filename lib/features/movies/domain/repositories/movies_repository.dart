import 'package:cards/features/movies/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies();
}