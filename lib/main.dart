import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flickmemo/helpers/language_helper.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flickmemo/pages/home_page.dart';
import 'package:flickmemo/pages/login_page.dart';
import 'package:flickmemo/pages/profile_page.dart';
import 'package:flickmemo/pages/search_page.dart';
import 'package:flickmemo/providers/language_provider.dart';
import 'package:flickmemo/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final language = await LanguageHelper.getLanguage();

  var languageProvider = LanguageProvider();
  LocaleSettings.setLocale(language == 'pt-BR' ? AppLocale.pt : AppLocale.en);

  await initializeDateFormatting(language, 'pt-BR');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: languageProvider),
    ],
    child: TranslationProvider(child: FlickmemoApp()),
  ));
}

class FlickmemoApp extends StatelessWidget {
  const FlickmemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: TranslationProvider.of(context).flutterLocale,
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: AuthPage(),
      routes: {
        '/login-page': (context) => const LoginPage(),
        '/home-page': (context) => const HomePage(),
        '/search-page': (context) => const SearchPage(),
        '/profile-page': (context) => const ProfilePage(),
      },
    );
  }
}
