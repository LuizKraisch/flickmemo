import 'package:flickmemo/components/error_info.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ErrorInfo shows the correct text and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ErrorInfo(
        errorMessage: "Error message",
      ),
    ));

    expect(find.text(t.homePage.movieCards.error), findsOneWidget);
    expect(find.text("Error message"), findsOneWidget);
  });
}
