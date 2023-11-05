import 'package:flickmemo/components/login_button.dart';
import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flickmemo/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child:
                Image.asset('assets/images/app-presentation.png', height: 500),
          ),
          MainContainer(),
        ],
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Image.asset('assets/logos/flickmemo-logo-small.png',
                    height: 30),
              ),
              Text(
                t.loginPage.title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                t.loginPage.subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: LoginButton(
                    onPressed: () => AuthService().signIn(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
