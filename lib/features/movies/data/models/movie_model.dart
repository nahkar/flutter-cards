import 'package:cards/features/movies/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String name;
  final String summary;

  const MovieModel({
    required this.id,
    required this.name,
    required this.summary,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      name: json['name'],
      summary: json['summary'] ?? '',
    );
  }

  Movie toEntity() {
    return Movie(
      id: id,
      name: name,
      summary: summary,
    );
  }

  factory MovieModel.fromEntity(Movie entity) {
    return MovieModel(
      id: entity.id,
      name: entity.name,
      summary: entity.summary,
    );
  }
}
