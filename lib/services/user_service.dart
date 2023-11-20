import 'dart:convert';
import 'package:flickmemo/env.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/flickmemo_user.dart';

class UserService {
  String baseUsersUrl = '$baseApiUrl/api/v1/users';

  Future<FlickmemoUser> getUserInfo(FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseUsersUrl/${user?.internalID}?$userParams'),
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

  static Future<void> updateUser(
      FlickmemoUser? user, String preferredLanguage) async {
    String userParams = buildBaseUserParams(user);
    String baseUsersUrl = '$baseApiUrl/api/v1/users';

    final response = await http.put(
      Uri.parse('$baseUsersUrl/${user?.internalID}?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "user": {"preferred_language": preferredLanguage}
      }),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to update user.');
    }
  }

  Future<List<Movie>> getFavoriteMovies(FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseUsersUrl/${user?.internalID}/favorites?$userParams'),
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

  Future<List<Movie>> getRecentMovies(FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseUsersUrl/${user?.internalID}/recent?$userParams'),
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

  Future<List<Movie>> getWatchlistMovies(FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseUsersUrl/${user?.internalID}/watchlist?$userParams'),
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
