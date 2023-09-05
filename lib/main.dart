import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flickmemo/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flickmemo/pages/home_page.dart';
import 'package:flickmemo/pages/presentation_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const FlickmemoApp());
}

class FlickmemoApp extends StatelessWidget {
  const FlickmemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
        routes: {
          '/presentation-page': (context) => const PresentationPage(),
          '/home-page': (context) => const HomePage(),
        });
  }
}
