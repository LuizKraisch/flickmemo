import 'package:flickmemo/controllers/flickmemo_user_stream_controller.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flickmemo/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final userController = FlickmemoUserStreamController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlickmemoUser?>(
      stream: userController.userStream,
      builder: (BuildContext context, AsyncSnapshot<FlickmemoUser?> snapshot) {
        final currentFlickmemoUser = snapshot.data;

        if (currentFlickmemoUser != null) {
          return BasePage(
            currentFlickmemoUser: currentFlickmemoUser,
          );
        } else {
          return LoginPage();
        }
      },
    );
  }
}
