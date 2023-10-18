import 'dart:convert';
import 'package:flickmemo/models/external_review.dart';
import 'package:flickmemo/models/movie.dart';
import 'package:flickmemo/models/review.dart';
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

  getMovieInfo(String movieId, FlickmemoUser? user) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": "VboqxtXSvPdJkRneDPWcrYdWDJk2",
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/movies/$movieId?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return {
        "data": Movie.fromJson(decodedResponse["data"]),
        "userReview": Review.fromJson(decodedResponse["user_review"]),
        "externalReviews": decodedResponse["tmdb_reviews"].map((externalReviews) {
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
}
