import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('pt');

  Locale get currentLocale => _currentLocale;

  void updateLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }

  AppLocale convertLocaleToAppLocale(Locale locale) {
    if (locale.languageCode == 'en') {
      return AppLocale.en;
    } else if (locale.languageCode == 'pt') {
      return AppLocale.pt;
    } else {
      return AppLocale.pt;
    }
  }
}
