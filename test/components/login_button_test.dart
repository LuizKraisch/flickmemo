import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flickmemo/components/login_button.dart';

void main() {
  testWidgets('LoginButton should have label text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginButton(
        onPressed: () {},
      ),
    ));

    expect(find.text("Continue with Google"), findsOneWidget);
  });
}
