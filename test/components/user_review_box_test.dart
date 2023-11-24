import 'package:flickmemo/components/user_review_box.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserReviewBox should have the correct texts',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 500,
              height: 500,
              child: UserReviewBox(
                review: Review(
                  uuid: '123',
                  score: '10.0',
                  note: 'Test note',
                  noteHasSpoilers: false,
                  favorite: true,
                  createdAt: DateTime.now().toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text(t.moviePage.body.userReview.title), findsOneWidget);
    expect(find.text(t.moviePage.body.favorite), findsOneWidget);
    expect(find.text('Favorite'), findsOneWidget);
    expect(find.text('10.0'), findsOneWidget);
    expect(find.text('Test note'), findsOneWidget);
  });
}
