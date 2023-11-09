import 'package:flickmemo/controllers/user_data.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/pages/base_page.dart';
import 'package:flickmemo/pages/login_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    Stream<FlickmemoUser?> userDataStream =
        Stream.periodic(Duration.zero, (_) => userData.user)
            .asBroadcastStream();

    return StreamBuilder<FlickmemoUser?>(
      stream: userDataStream,
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
