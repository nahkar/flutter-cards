import 'package:cards/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.rating,
    required super.releaseDate,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'vote_average': rating,
      'release_date': releaseDate.toIso8601String(),
    };
  }
}
