import 'dart:convert';
import 'package:flickmemo/env.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/external_review.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/flickmemo_user.dart';

class MovieService {
  String baseMoviesUrl = '$baseApiUrl/api/v1/movies';

  getTrendingMovies(FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseMoviesUrl/trending?$userParams'),
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
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseMoviesUrl/discover?$userParams'),
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

  getMovieInfo(String movieId, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseMoviesUrl/$movieId?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return {
        "data": Movie.fromJson(decodedResponse["data"]),
        "addedToUserWatchlist": decodedResponse["added_to_user_watchlist"],
        "userReview": decodedResponse["user_review"] != null
            ? Review.fromJson(decodedResponse["user_review"])
            : null,
        "externalReviews":
            decodedResponse["tmdb_reviews"].map((externalReviews) {
          return ExternalReview.fromJson(externalReviews);
        }).toList(),
        "similarMovies": decodedResponse["similar"].map((similarMovies) {
          return Movie.fromJson(similarMovies);
        }).toList(),
      };
    } else {
      throw Exception('Failed to find movie data.');
    }
  }

  getMovieBySearch(String query, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseMoviesUrl/search?query=$query&$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = json.decode(response.body)["results"];
      List<dynamic> movies = decodedResponse.map((movieData) {
        return Movie.fromJson(movieData);
      }).toList();
      return movies;
    } else {
      throw Exception('Failed to find movies related to the query.');
    }
  }

  Future<void> addMovieToWatchlist(String movieId, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseMoviesUrl/add_to_watchlist?$userParams&movieId=$movieId'),
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

  Future<void> removeMovieFromWatchlist(
      String movieId, FlickmemoUser? user) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse(
          '$baseMoviesUrl/remove_from_watchlist?$userParams&movieId=$movieId'),
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
