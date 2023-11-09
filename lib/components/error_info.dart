import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorInfo extends StatelessWidget {
  final String errorMessage;

  const ErrorInfo({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Icon(FontAwesomeIcons.circleExclamation, size: 40),
        SizedBox(height: 10),
        Text(
          t.homePage.movieCards.error,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(errorMessage),
      ],
    );
  }
}
