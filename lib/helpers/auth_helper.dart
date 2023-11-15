import 'dart:convert';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<void> saveFlickmemoUser(FlickmemoUser? flickmemoUser) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final flickmemoUserJson = flickmemoUser?.toJson();
    await sharedPreferences.setString(
        'currentFlickmemoUser', flickmemoUserJson!);
  }

  static Future<FlickmemoUser?> getFlickmemoUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final flickmemoUserJson =
        sharedPreferences.getString('currentFlickmemoUser');
    if (flickmemoUserJson != null) {
      final flickmemoUserMap = jsonDecode(flickmemoUserJson);
      return FlickmemoUser.fromJson(flickmemoUserMap);
    } else {
      return null;
    }
  }

  static Future<void> deleteFlickmemoUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('currentFlickmemoUser');
  }
}
