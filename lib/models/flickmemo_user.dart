import 'dart:convert';

class FlickmemoUser {
  final String internalID;
  final String? googleUserUID;
  final Map<String, String>? token;
  final String firstName;
  final String lastName;
  final String? email;
  final String photoURL;
  final String createdAt;

  final String? watchedCount;
  final String? favoritesCount;
  final String? watchlistCount;

  const FlickmemoUser({
    required this.internalID,
    this.googleUserUID,
    this.token,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.photoURL,
    required this.createdAt,
    this.watchedCount,
    this.favoritesCount,
    this.watchlistCount,
  });

  factory FlickmemoUser.fromJson(Map<String, dynamic> json) {
    return FlickmemoUser(
      internalID: json['internal_id'] ?? '',
      googleUserUID: json['google_user_uid'],
      token: {
        "uuid": json['token']['uuid'],
        "token": json['token']['token'],
      },
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      photoURL: json['photo_url'],
      createdAt: json['created_at'],
      watchedCount: json['watched_count'],
      favoritesCount: json['favorites_count'],
      watchlistCount: json['watchlist_count'],
    );
  }

  factory FlickmemoUser.fromInfoJson(Map<String, dynamic> json) {
    return FlickmemoUser(
      firstName: json['first_name'],
      lastName: json['last_name'],
      photoURL: json['photo_url'],
      createdAt: json['created_at'],
      internalID: json['internal_id'],
      watchedCount: json['watched_count'],
      favoritesCount: json['favorites_count'],
      watchlistCount: json['watchlist_count'],
    );
  }

  String toJson() {
    return jsonEncode({
      'internal_id': internalID,
      'google_user_uid': googleUserUID,
      'token': token,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'photo_url': photoURL,
      'created_at': createdAt,
      'watched_count': watchedCount,
      'favorites_count': favoritesCount,
      'watchlist_count': watchlistCount,
    });
  }
}
