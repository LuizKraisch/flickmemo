import 'package:shared_preferences/shared_preferences.dart';

// Language Reference
//
// pt-BR = Portuguese (Brazil)
// en-US = English
//

class LanguageHelper {
  static Future<void> saveLanguage(String language) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('currentLanguage', language);
  }

  static Future<String?> getLanguage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final currentLanguage = sharedPreferences.getString('currentLanguage');

    if (currentLanguage != null) {
      return currentLanguage;
    } else {
      saveLanguage('pt-BR');
      return 'pt-BR';
    }
  }

  static Future<void> deleteLanguage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('currentLanguage');
  }
}
