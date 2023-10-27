import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.book),
                  SizedBox(width: 10.0),
                  Text('Licenses',
                      style: Theme.of(context).textTheme.displayMedium),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Movie Database",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/logos/tmdb-logo.png',
                    width: 250,
                  ),
                  SizedBox(height: 10),
                  SelectableText(
                      "This app uses the TMDb (The Movie Database) API to provide movie and TV show information. TMDb is a free and open movie database service. This product uses the TMDb API but is not endorsed or certified by TMDb.",
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 10),
                  SelectableText(
                      "TMDb Attribution: This product uses the TMDb API but is not endorsed or certified by TMDb. You can find the TMDb API documentation at https://www.themoviedb.org/documentation/api. Please note that your use of the TMDb API should comply with TMDb's terms of use, including but not limited to their API terms and conditions. TMDb's terms and conditions can be found at https://www.themoviedb.org/terms-of-use. This app is provided as-is without any warranty or guarantee. The developers of this app are not responsible for the accuracy or quality of the data provided by the TMDb API.",
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 10),
                ],
              )
            ],
          )),
    );
  }
}
