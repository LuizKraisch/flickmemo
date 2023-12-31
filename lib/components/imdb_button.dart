import 'package:flickmemo/i18n/strings.g.dart';
import 'package:flickmemo/services/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IMDbButton extends StatelessWidget {
  final String imdbId;

  const IMDbButton({
    super.key,
    required this.imdbId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchIMDbPage(imdbId),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.imdb,
            size: 20,
          ),
          SizedBox(width: 3),
          Text(
            t.moviePage.body.stats.visitImdb,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(width: 5),
          Icon(
            FontAwesomeIcons.upRightFromSquare,
            size: 12,
          )
        ],
      ),
    );
  }
}
