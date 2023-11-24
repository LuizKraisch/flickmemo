import 'package:flickmemo/components/imdb_button.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('IMDbButton should have label text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: IMDbButton(
        imdbId: '1234',
      ),
    ));

    expect(find.text(t.moviePage.body.stats.visitImdb), findsOneWidget);
  });
}
