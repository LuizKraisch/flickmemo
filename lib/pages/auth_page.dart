import 'package:flickmemo/controllers/flickmemo_user_stream_controller.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flickmemo/pages/login_page.dart';

final flickmemoUserStreamController = FlickmemoUserStreamController();

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlickmemoUser?>(
      stream: flickmemoUserStreamController.flickmemoUserStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final currentUser = snapshot.data;
          if (currentUser != null) {
            return BasePage();
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
