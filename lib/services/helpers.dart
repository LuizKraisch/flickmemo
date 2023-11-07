import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flickmemo/env.dart';

String buildBaseUserParams(FlickmemoUser? user) {
  final Map<String, dynamic> flickmemoUserData = {
    "token": user!.token?["token"],
    "google_user_uid": user.googleUserUID,
  };

  return 'accessToken=${flickmemoUserData['token']}&googleUserId=${flickmemoUserData['google_user_uid']}';
}

Future<void> launchDeveloperEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: devEmail,
    queryParameters: {
      'subject': t.toast.helpers.emailSubject,
      'body': t.toast.helpers.emailBody,
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    addToast(t.toast.helpers.emailFailed);
  }
}

Future<void> launchIMDbPage(String imdbId) async {
  final imdbUrl = Uri.parse('https://www.imdb.com/title/$imdbId/');
  if (await canLaunchUrl(imdbUrl)) {
    await launchUrl(imdbUrl);
  } else {
    addToast(t.toast.helpers.imdbFailed);
  }
}

void addToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Color(0xff1D1F24),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
