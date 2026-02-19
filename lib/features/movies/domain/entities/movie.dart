class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double rating;
  final DateTime releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });
}
