import 'dart:convert';
import 'package:flickmemo/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/flickmemo_user.dart';

class MovieService {
  getTrendingMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
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

  getDiscoverMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": "VboqxtXSvPdJkRneDPWcrYdWDJk2",
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/movies/discover?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
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
