import 'package:flutter/material.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  return BasePage();
                } else {
                  return LoginPage();
                }
            }
          }),
    );
  }
}
