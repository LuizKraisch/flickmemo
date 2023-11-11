import 'dart:convert';
import 'package:flickmemo/env.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/flickmemo_user.dart';

class ReviewService {
  String baseReviewsUrl = '$baseApiUrl/api/v1/reviews';

  getReview({
    required FlickmemoUser? user,
    required String reviewId,
  }) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.get(
      Uri.parse('$baseReviewsUrl/$reviewId?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Review.fromJson(decodedResponse);
    } else {
      addToast(t.toast.review.error);
      throw Exception('Error when loading the review');
    }
  }

  createReview({
    required BuildContext context,
    required FlickmemoUser? user,
    required dynamic reviewData,
    required String movieId,
  }) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.post(
      Uri.parse('$baseReviewsUrl?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "review": {
          "score": reviewData['score'],
          "note": reviewData['note'],
          "note_has_spoilers": reviewData['noteHasSpoilers'],
          "favorite": reviewData['favorite'],
          "movie_id": movieId,
        }
      }),
    );

    if (response.statusCode == 200) {
      addToast(t.toast.review.reviewSaved);
    } else {
      addToast(t.toast.review.error);
      throw Exception('Error when adding the review.');
    }
  }

  updateReview({
    required BuildContext context,
    required FlickmemoUser? user,
    required dynamic reviewData,
  }) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.patch(
      Uri.parse('$baseReviewsUrl/${reviewData['uuid']}?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "review": {
          "score": reviewData['score'],
          "note": reviewData['note'],
          "note_has_spoilers": reviewData['noteHasSpoilers'],
          "favorite": reviewData['favorite'],
        }
      }),
    );

    if (response.statusCode == 200) {
      addToast(t.toast.review.reviewUpdated);
    } else {
      addToast(t.toast.review.error);
      throw Exception('Error when updating the review.');
    }
  }

  deleteReview({
    required FlickmemoUser? user,
    required String reviewId,
  }) async {
    String userParams = buildBaseUserParams(user);

    final response = await http.delete(
      Uri.parse('$baseReviewsUrl/$reviewId?$userParams'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      addToast(t.toast.review.reviewRemoved);
    } else {
      addToast(t.toast.review.error);
      throw Exception('Error when deleting the review.');
    }
  }
}
