import 'package:cards/features/movies/data/models/movie_model.dart';

abstract class MoviesDatasource {
  Future<List<MovieModel>> getMovies();
}