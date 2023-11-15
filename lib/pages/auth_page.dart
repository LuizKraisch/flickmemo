import 'dart:async';
import 'package:flickmemo/helpers/auth_helper.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flickmemo/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/models/flickmemo_user.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          Duration(milliseconds: 1), () => AuthHelper.getFlickmemoUser()),
      builder: (context, AsyncSnapshot<FlickmemoUser?> snapshot) {
        if (snapshot.data != null) {
          return BasePage(
            currentFlickmemoUser: snapshot.data,
          );
        } else {
          return LoginPage();
        }
      },
    );
  }
}
