import 'package:flickmemo/components/external_review_box.dart';
import 'package:flickmemo/models/external_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ExternalReviewBox shows the external review information',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ExternalReviewBox(
        review: ExternalReview(
          authorDetails: {"avatar_path": "", "name": "", "rating": "10.0"},
          content: "This is a content",
          createdAt: "2023-01-01",
        ),
      ),
    ));

    expect(find.text("TMDB User"), findsOneWidget);
    expect(find.text("10.0"), findsOneWidget);
    expect(find.text("This is a content"), findsOneWidget);
    expect(find.text("2023-01-01"), findsOneWidget);
  });
}
