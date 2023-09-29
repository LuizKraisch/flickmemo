import 'package:flickmemo/components/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MovieCard should have the title text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MovieCard(),
    ));

    expect(find.text("Omgggg this is a movie!"), findsOneWidget);
  });
}
