import 'package:url_launcher/url_launcher.dart';

Future<void> launchDeveloperEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'luizkraisch22@gmail.com',
    queryParameters: {
      'subject': 'Hello! I want to talk about Flickmemo',
      'body': 'Here you write a nice message for me :)',
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch email. Please, try again.';
  }
}

Future<void> launchIMDbPage(String imdbId) async {
  final imdbUrl = Uri.parse('https://www.imdb.com/title/$imdbId/');
  if (await canLaunchUrl(imdbUrl)) {
    await launchUrl(imdbUrl);
  } else {
    throw 'Could not launch IMDb page. Please, try again.';
  }
}
