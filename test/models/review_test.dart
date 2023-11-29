import 'package:flickmemo/models/review.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Review', () {
    test('fromJson should create a Review instance from JSON', () {
      final Map<String, dynamic> json = {
        'uuid': 'abc123',
        'score': '8.5',
        'note': 'Great movie!',
        'note_has_spoilers': true,
        'favorite': false,
        'created_at': '2023-01-01T12:00:00Z',
      };

      final review = Review.fromJson(json);

      expect(review, isA<Review>());
      expect(review.uuid, 'abc123');
      expect(review.score, '8.5');
      expect(review.note, 'Great movie!');
      expect(review.noteHasSpoilers, true);
      expect(review.favorite, false);
      expect(review.createdAt, '2023-01-01T12:00:00Z');
    });

    test(
        'fromJson should create a Review instance with default values if optional fields are missing',
        () {
      final Map<String, dynamic> json = {
        'uuid': 'abc123',
        'score': '8.5',
        'note': 'Great movie!',
      };

      final review = Review.fromJson(json);

      expect(review, isA<Review>());
      expect(review.uuid, 'abc123');
      expect(review.score, '8.5');
      expect(review.note, 'Great movie!');
      expect(review.noteHasSpoilers, false);
      expect(review.favorite, false);
      expect(review.createdAt, '');
    });

    test(
        'fromJson should handle null input and create a Review instance with default values',
        () {
      const Map<String, dynamic>? json = null;

      final review = Review.fromJson(json);

      expect(review, isA<Review>());
      expect(review.uuid, '');
      expect(review.score, '');
      expect(review.note, '');
      expect(review.noteHasSpoilers, false);
      expect(review.favorite, false);
      expect(review.createdAt, '');
    });
  });
}
