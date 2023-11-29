import 'package:flickmemo/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProgressBar displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProgressBar(
            currentIndex: 2,
            totalItems: 5,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    final linearProgressIndicator = find
        .byType(LinearProgressIndicator)
        .evaluate()
        .first
        .widget as LinearProgressIndicator;
    expect(linearProgressIndicator.value, equals(2 / 5));
  });
}
