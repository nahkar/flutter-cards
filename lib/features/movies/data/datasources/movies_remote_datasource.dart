import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import 'movies_datasource.dart';

class MoviesRemoteDatasource implements MoviesDatasource {
  final http.Client client;

  MoviesRemoteDatasource(this.client);

  @override
  Future<List<MovieModel>> getMovies() async {
    final url = Uri.parse('https://api.tvmaze.com/shows');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch movies: ${response.statusCode}');
    }
  }
}
