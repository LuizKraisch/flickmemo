import 'package:flickmemo/models/external_review.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExternalReview', () {
    test('fromJson should create an ExternalReview instance from JSON', () {
      final Map<String, dynamic> json = {
        'author_details': {'name': 'John Doe', 'email': 'john@example.com'},
        'content': 'Great product!',
        'created_at': '2023-01-01T12:00:00Z',
      };

      final externalReview = ExternalReview.fromJson(json);

      expect(externalReview, isA<ExternalReview>());
      expect(externalReview.authorDetails, isA<Map<String, dynamic>>());
      expect(externalReview.authorDetails['name'], 'John Doe');
      expect(externalReview.content, 'Great product!');
      expect(externalReview.createdAt, '2023-01-01T12:00:00Z');
    });
  });
}
