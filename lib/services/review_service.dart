import 'dart:convert';
import 'package:flickmemo/models/review.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flickmemo/models/flickmemo_user.dart';

class ReviewService {
  getReview({
    required FlickmemoUser? user,
    required String reviewId,
  }) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.get(
      Uri.parse(
          'http://localhost:3000/api/v1/reviews/$reviewId?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return Review.fromJson(decodedResponse);
    } else {
      addToast("Error when loading the review. Please, try again");
      throw Exception('Error when loading the review');
    }
  }

  createReview({
    required BuildContext context,
    required FlickmemoUser? user,
    required dynamic reviewData,
    required String movieId,
  }) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.post(
      Uri.parse(
          'http://localhost:3000/api/v1/reviews?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "review": {
          "uuid": reviewData['uuid'],
          "score": reviewData['score'],
          "note": reviewData['note'],
          "note_has_spoilers": reviewData['noteHasSpoilers'],
          "favorite": reviewData['favorite'],
          "movie_id": movieId,
        }
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      addToast("Error when adding the review. Please, try again");
      throw Exception('Error when adding the review.');
    }
  }

  updateReview({
    required BuildContext context,
    required FlickmemoUser? user,
    required dynamic reviewData,
  }) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.patch(
      Uri.parse(
          'http://localhost:3000/api/v1/reviews/${reviewData['uuid']}?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
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
      return true;
    } else {
      addToast("Error when updating the review. Please, try again");
      throw Exception('Error when updating the review.');
    }
  }

  deleteReview({
    required FlickmemoUser? user,
    required String reviewId,
  }) async {
    final Map<String, dynamic> flickmemoUserData = {
      "token": user!.token?["token"],
      "google_user_uid": user.googleUserUID,
      "internal_id": user.internalID,
    };

    final response = await http.delete(
      Uri.parse(
          'http://localhost:3000/api/v1/reviews/$reviewId?accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      addToast("Error when deleting the review. Please, try again");
      throw Exception('Error when deleting the review.');
    }
  }
}
