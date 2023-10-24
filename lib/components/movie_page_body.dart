import 'package:expandable_text/expandable_text.dart';
import 'package:flickmemo/components/external_review_box.dart';
import 'package:flickmemo/components/imdb_button.dart';
import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/components/user_review_box.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePageBody extends StatefulWidget {
  final FlickmemoUser? currentFlickmemoUser;
  final Map<String, dynamic>? movieData;

  const MoviePageBody({
    required this.currentFlickmemoUser,
    this.movieData,
    super.key,
  });

  @override
  State<MoviePageBody> createState() => _MoviePageBodyState();
}

class _MoviePageBodyState extends State<MoviePageBody> {
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
            widget.movieData?["data"].overview as String,
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
          SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "POPULARITY",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.movieData?["data"].popularity,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SEE IT ON IMDB",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  IMDbButton(imdbId: widget.movieData?["data"].imdbID)
                ],
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RELEASE DATE",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        formatMovieReleaseDate(
                            widget.movieData?["data"].releaseDate),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Reviews',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 5),
          widget.movieData?["userReview"].note != ""
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 0.5,
                        color: Color.fromARGB(255, 76, 80, 90),
                      ),
                    ),
                    UserReviewBox(review: widget.movieData?["userReview"]),
                  ],
                )
              : SizedBox(),
          widget.movieData?["externalReviews"].length > 0
              ? SizedBox(
                  height:
                      widget.movieData?["externalReviews"].length.toDouble() *
                          140,
                  child: Column(
                    children: [
                      ...widget.movieData?["externalReviews"].map<Widget>(
                        (review) {
                          return ExternalReviewBox(review: review);
                        },
                      ).toList(),
                    ],
                  ),
                )
              : Container(
                  height: 80,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff1D1F24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Icon(
                        FontAwesomeIcons.triangleExclamation,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "There are no reviews to show.",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ]),
                  ),
                ),
          SizedBox(height: 20),
          Text(
            'Similar Movies',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    widget.movieData?["similarMovies"].map<Widget>((movie) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: MoviePoster(
                      movie: movie,
                      currentFlickmemoUser: widget.currentFlickmemoUser,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
