import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/flickmemo_user.dart';

class UserService {
  getUserInfo(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/users/${flickmemoUserData['internal_id']}?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return FlickmemoUser.fromInfoJson(decodedResponse);
    } else {
      throw Exception('Failed to find user info.');
    }
  }

  getFavoriteMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/users/${flickmemoUserData['internal_id']}/favorites?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
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

  getRecentMovies(FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/users/${flickmemoUserData['internal_id']}/recent?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
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
