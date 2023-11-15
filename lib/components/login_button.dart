import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPressed;
  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.inverseSurface,
        minimumSize: Size.fromHeight(40),
        padding: EdgeInsets.all(15.0),
        shape: StadiumBorder(),
        backgroundColor: Theme.of(context).colorScheme.outline,
      ),
      onPressed: onPressed,
      icon: Image.asset('assets/logos/google-g-logo.png', height: 25),
      label: Text(
        t.loginPage.googleButton,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
