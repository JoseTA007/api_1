import 'package:api/api/movie.dart';
import 'package:api/api/movies.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class TheMovieDBService {
  static const String apiUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "99b4c3070137e46945a47d68eb4d49f3";

  static Future<List<Movie>> getTopRatedMovies() async {
    var url = "$apiUrl/movie/top_rated?api_key=$apiKey&language=es";
    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      final respuestaJSON = json.decode(respuesta.body);
      final peliculasMejorValoradas =
          Movies.fromJsonList(respuestaJSON['results']);
      return peliculasMejorValoradas;
    }
    return <Movie>[];
  }
}
