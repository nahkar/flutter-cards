import 'package:cards/features/movies/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double rating;
  final DateTime releaseDate;

  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] as num).toDouble(),
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      rating: rating,
      releaseDate: releaseDate,
    );
  }

  factory MovieModel.fromEntity(Movie entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      rating: entity.rating,
      releaseDate: entity.releaseDate,
    );
  }
}
