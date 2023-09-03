
import 'package:flutter/material.dart';
import 'package:flickmemo/pages/presentation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlickmemoApp());
}

class FlickmemoApp extends StatelessWidget {
  const FlickmemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PresentationPage(),
    );
  }
}
