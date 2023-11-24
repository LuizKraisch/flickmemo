import 'package:flickmemo/components/search_header.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchHeader should have the correct texts',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            child: SearchHeader(
              currentFlickmemoUser: null,
            ),
          ),
        ),
      ),
    );

    expect(find.text(t.searchPage.header.title), findsOneWidget);
    expect(find.text(t.searchPage.header.searchBarPlaceholder), findsOneWidget);
  });
}
