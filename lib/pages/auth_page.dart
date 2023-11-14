import 'dart:async';
import 'dart:convert';
import 'package:flickmemo/helpers/auth_helper.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flickmemo/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flickmemo/models/flickmemo_user.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  late FlickmemoUser? flickmemoUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? flickmemoUserJson = prefs.getString('currentFlickmemoUser');

    if (flickmemoUserJson != null) {
      final flickmemoUserMap = jsonDecode(flickmemoUserJson);
      flickmemoUser = FlickmemoUser.fromJson(flickmemoUserMap);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          Duration(milliseconds: 1), () => AuthHelper.getFlickmemoUser()),
      builder: (context, AsyncSnapshot<FlickmemoUser?> snapshot) {
        if (snapshot.data != null) {
          return BasePage(
            currentFlickmemoUser: flickmemoUser!,
          );
        } else {
          return LoginPage();
        }
      },
    );
  }
}
