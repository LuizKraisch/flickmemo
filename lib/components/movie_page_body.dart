import 'package:expandable_text/expandable_text.dart';
import 'package:flickmemo/components/movie_poster.dart';
import 'package:flickmemo/models/flickmemo_user.dart';
import 'package:flickmemo/models/review.dart';
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
          Text(
            'Reviews',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 5),
          widget.movieData?["userReview"].note != null
              ? ReviewBox(review: widget.movieData?["userReview"])
              : SizedBox(),
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

class ReviewBox extends StatelessWidget {
  final Review review;

  const ReviewBox({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff1D1F24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Your Review",
                      style: Theme.of(context).textTheme.titleSmall),
                  Text("July 18, 2023",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.solidStar,
                      color: Theme.of(context).colorScheme.scrim, size: 20),
                  SizedBox(width: 5),
                  Text(
                    "7.0",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 200.0,
                  maxWidth: 290.0,
                  minHeight: 30.0,
                  maxHeight: 50.0,
                ),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
