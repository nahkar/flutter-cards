import 'package:cards/features/movies/data/datasources/movies_datasource.dart';
import 'package:cards/features/movies/data/models/movie_model.dart';

class MoviesMockDatasource implements MoviesDatasource {
  @override
  Future<List<MovieModel>> getMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      MovieModel(
        id: 1,
        name: 'Interstellar',
        summary: 'Overview 1',
      ),
      MovieModel(
        id: 2,
        name: 'Inception',
        summary: 'Overview 2',
      ),
      MovieModel(
        id: 3,
        name: 'The Dark Knight',
        summary: 'Overview 3',
      ),
    ];
  }
}