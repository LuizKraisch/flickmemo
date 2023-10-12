import 'dart:convert';
import 'package:flickmemo/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/flickmemo_user.dart';

class MovieService {
  getTrendingMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token["token"],
      "google_user_uid": "VboqxtXSvPdJkRneDPWcrYdWDJk2",
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/movies/trending?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = json.decode(response.body);
      List<Movie> movies = decodedResponse.map((movieData) {
        return Movie.fromJson(movieData);
      }).toList();
      return movies;
    } else {
      throw Exception('Failed to find movie data.');
    }
  }

  getFavoriteMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token["token"],
      "google_user_uid": "VboqxtXSvPdJkRneDPWcrYdWDJk2",
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/users/c664a344-d788-4ab5-9c2c-19f13115c87a/favorites?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = json.decode(response.body);
      List<Movie> movies = decodedResponse.map((movieData) {
        return Movie.fromJson(movieData);
      }).toList();
      return movies;
    } else {
      throw Exception('Failed to find movie data.');
    }
  }
}
