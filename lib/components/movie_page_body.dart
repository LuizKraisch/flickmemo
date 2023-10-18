import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePageBody extends StatelessWidget {
  final Map<String, dynamic>? movieData;

  const MoviePageBody({
    this.movieData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 5),
          ExpandableText(
            movieData?["data"].overview as String,
            expandText: 'Read more',
            collapseText: 'Show less',
            maxLines: 3,
            linkColor: Colors.white,
            animation: true,
            collapseOnTextTap: true,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            linkStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
