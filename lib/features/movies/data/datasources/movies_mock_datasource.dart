import 'package:cards/features/movies/data/datasources/movies_datasource.dart';
import 'package:cards/features/movies/data/models/movie_model.dart';

class MoviesMockDatasource implements MoviesDatasource {
  @override
  Future<List<MovieModel>> getMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      MovieModel(
        id: 1,
        title: 'Interstellar',
        overview: 'Overview 1',
        posterPath: 'posterPath 1',
        rating: 5.0,
        releaseDate: DateTime.now(),
      ),
      MovieModel(
        id: 2,
        title: 'Inception',
        overview: 'Overview 2',
        posterPath: 'posterPath 2',
        rating: 4.5,
        releaseDate: DateTime.now(),
      ),
      MovieModel(
        id: 3,
        title: 'The Dark Knight',
        overview: 'Overview 3',
        posterPath: 'posterPath 3',
        rating: 4.0,
        releaseDate: DateTime.now(),
      ),
    ];
  }
}