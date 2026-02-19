import 'package:cards/features/movies/domain/entities/movie.dart';
import 'package:cards/features/movies/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() {
    return repository.getMovies();
  }
}
