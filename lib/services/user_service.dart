import 'dart:convert';
import 'package:flickmemo/env.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/flickmemo_user.dart';

class UserService {
  String baseUsersUrl = '$baseApiUrl/api/v1/users';

  getUserInfo(FlickmemoUser? user) async {
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

  getFavoriteMovies(FlickmemoUser? user) async {
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

  getRecentMovies(FlickmemoUser? user) async {
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

  getWatchlistMovies(FlickmemoUser? user) async {
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

  addMovieToWatchlist(String movieId, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse(
          '$baseUsersUrl/${user?.internalID}/add_to_watchlist?$userParams&movieId=$movieId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return addToast(t.toast.movies.movieAddedToWatchlist);
    } else if (response.statusCode == 409) {
      return addToast(t.toast.movies.movieAlreadyOnWatchlist);
    } else {
      addToast(t.toast.movies.failedtoAddToWatchlist);
      throw Exception('Failed to add movie to watchlist.');
    }
  }

  removeMovieFromWatchlist(String movieId, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse(
          '$baseUsersUrl/${user?.internalID}/remove_from_watchlist?$userParams&movieId=$movieId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return addToast(t.toast.movies.movieRemovedFromWatchlist);
    } else {
      addToast(t.toast.movies.failedtoRemoveFromWatchlist);
      throw Exception('Failed to remove movie from watchlist.');
    }
  }
}
