import 'package:flutter/material.dart';
import 'package:flickmemo/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickmemo/pages/presentation_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return PresentationPage();
              }
            }));
  }
}
