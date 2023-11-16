import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/models/external_review.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ExternalReviewPage extends StatelessWidget {
  final ExternalReview review;

  const ExternalReviewPage({
    Key? key,
    required this.review,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(review
                                .authorDetails["avatar_path"] !=
                            null
                        ? 'https://www.themoviedb.org/t/p/original/${review.authorDetails["avatar_path"]}'
                        : 'https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                t.externalReviewPage.title(
                    name: review.authorDetails["name"] != ""
                        ? review.authorDetails["name"]
                        : 'TMDB User'),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.externalReviewPage.subtitle(
                        date: formatExternalReviewDate(review.createdAt)),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 10),
                  SelectableText(formatExternalReviewContent(review.content),
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 10),
                ],
              )
            ],
          )),
    );
  }
}
