import 'dart:convert';
import 'package:flickmemo/helpers/auth_helper.dart';
import 'package:flickmemo/env.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FlickmemoUser? currentFlickmemoUser;
  final BuildContext context;

  AuthService(this.context);

  getFlickmemoUser(User? userData) async {
    final Map<String, dynamic> flickmemoUserData = {
      "uid": userData!.uid,
      "email": userData.email,
      "firstName": userData.displayName,
      "lastName": 'yay',
      "photoURL": userData.photoURL,
    };

    final response = await http.post(
      Uri.parse('$baseApiUrl/api/v1/auth/access'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "user": {
          "google_user_uid": flickmemoUserData['uid'],
          "email": flickmemoUserData['email'],
          "first_name": flickmemoUserData['firstName'],
          "last_name": flickmemoUserData['lastName'],
          "photo_url": flickmemoUserData['photoURL'],
        }
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      return FlickmemoUser.fromJson(decodedResponse['user']);
    } else {
      throw Exception('Failed to load user data.');
    }
  }

  Future<FlickmemoUser?> signIn() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    final userData = FirebaseAuth.instance.currentUser;

    currentFlickmemoUser = await getFlickmemoUser(userData);
    await AuthHelper.saveFlickmemoUser(currentFlickmemoUser);

    return currentFlickmemoUser;
  }
}
