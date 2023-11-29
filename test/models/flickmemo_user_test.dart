import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlickmemoUser', () {
    test('fromJson should create a FlickmemoUser instance from JSON', () {
      final Map<String, dynamic> json = {
        'internal_id': '123',
        'google_user_uid': '456',
        'token': {'uuid': '789', 'token': 'xyz'},
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'john@example.com',
        'photo_url': 'https://example.com/photo.jpg',
        'created_at': '2023-01-01T12:00:00Z',
        'watched_count': '10',
        'favorites_count': '5',
        'watchlist_count': '8',
      };

      final flickmemoUser = FlickmemoUser.fromJson(json);

      expect(flickmemoUser, isA<FlickmemoUser>());
      expect(flickmemoUser.internalID, '123');
      expect(flickmemoUser.googleUserUID, '456');
      expect(flickmemoUser.token, {'uuid': '789', 'token': 'xyz'});
      expect(flickmemoUser.firstName, 'John');
      expect(flickmemoUser.lastName, 'Doe');
      expect(flickmemoUser.email, 'john@example.com');
      expect(flickmemoUser.photoURL, 'https://example.com/photo.jpg');
      expect(flickmemoUser.createdAt, '2023-01-01T12:00:00Z');
      expect(flickmemoUser.watchedCount, '10');
      expect(flickmemoUser.favoritesCount, '5');
      expect(flickmemoUser.watchlistCount, '8');
    });

    test(
        'fromJson should create a FlickmemoUser instance with default values if optional fields are missing',
        () {
      final Map<String, dynamic> json = {
        'internal_id': '123',
        'first_name': 'John',
        'last_name': 'Doe',
        'photo_url': 'https://example.com/photo.jpg',
        'token': {
          "uuid": "",
          "token": "",
        },
        'created_at': '2023-01-01T12:00:00Z',
      };

      final flickmemoUser = FlickmemoUser.fromJson(json);

      expect(flickmemoUser, isA<FlickmemoUser>());
      expect(flickmemoUser.internalID, '123');
      expect(flickmemoUser.googleUserUID, null);
      expect(flickmemoUser.token, {
        "uuid": "",
        "token": "",
      });
      expect(flickmemoUser.firstName, 'John');
      expect(flickmemoUser.lastName, 'Doe');
      expect(flickmemoUser.email, null);
      expect(flickmemoUser.photoURL, 'https://example.com/photo.jpg');
      expect(flickmemoUser.createdAt, '2023-01-01T12:00:00Z');
      expect(flickmemoUser.watchedCount, null);
      expect(flickmemoUser.favoritesCount, null);
      expect(flickmemoUser.watchlistCount, null);
    });

    test('toJson should convert a FlickmemoUser instance to JSON', () {
      final flickmemoUser = FlickmemoUser(
        internalID: '123',
        googleUserUID: '456',
        token: {'uuid': '789', 'token': 'xyz'},
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@example.com',
        photoURL: 'https://example.com/photo.jpg',
        createdAt: '2023-01-01T12:00:00Z',
        watchedCount: '10',
        favoritesCount: '5',
        watchlistCount: '8',
      );

      final json = flickmemoUser.toJson();

      expect(json, isA<String>());
    });
  });
}
